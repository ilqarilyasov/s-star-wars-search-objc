//
//  IIIPersonController.m
//  SStarWarsSearchObjc
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import "IIIPersonController.h"
#import "../Model/IIIPerson.h"

@implementation IIIPersonController

#pragma mark - Methods

-(void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
                          completion:(void (^)(NSArray *, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *searchQuery = [NSURLQueryItem queryItemWithName:@"search" value:searchTerm];
    [components setQueryItems: [NSArray arrayWithObject:searchQuery]];
    // [components setQueryItems: @[searchQuery]]; same thing
    
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:[components URL]];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"Error performing data task: %@", error);
            completion(nil, error);
            return;
        }
        
        if (data == nil) {
            NSLog(@"No data returned from data task");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // Check to make sure the dictionary is actually a dictionary
        // If it's not a dictionary handle the error
        if ([jsonDictionary isKindOfClass:[NSDictionary class]] == NO) {
            NSLog(@"JSON is not a dictionary. Wohoo!");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        
        // If it's a dictionary then create Person object(s) from it
        NSArray *results = jsonDictionary[@"results"];
        NSMutableArray *people = [[NSMutableArray alloc] init]; // @[] is for only NSArray not mutable array
        
        for (NSDictionary *dictionary in results) {
            IIIPerson *person = [[IIIPerson alloc] initWithDictionary:dictionary];
            [people addObject:person];
        }
        
        completion(people, nil);
    }];
    
    [dataTask resume];
    
}

#pragma mark - Properties

static NSString * const baseURLString = @"https://swapi.co/api/people";

@end
