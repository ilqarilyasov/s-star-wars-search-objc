//
//  IIIPerson.m
//  SStarWarsSearchObjc
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//

#import "IIIPerson.h"

@implementation IIIPerson

- (instancetype)initWithName:(NSString *)name
                   birthYear:(NSString *)birthYear
                    eyeColor:(NSString *)eyeColor
                      height:(NSString *)height
{
    self = [super init];
    
    if (self) {
        _name = name;
        _birthYear = birthYear;
        _eyeColor = eyeColor;
        _height = height;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = [dictionary objectForKey:@"name"];
    NSString *birthYear = [dictionary valueForKey:@"birth_year"];
    NSString *eyeColor = dictionary[@"eye_color"];
    NSString *height = dictionary[@"height"];
    
    self = [self initWithName:name birthYear:birthYear
                     eyeColor:eyeColor height:height];
    
    return self;
}

@end
