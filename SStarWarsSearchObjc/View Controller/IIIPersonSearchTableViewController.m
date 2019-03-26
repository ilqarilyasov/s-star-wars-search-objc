//
//  IIIPersonSearchTableViewController.m
//  SStarWarsSearchObjc
//
//  Created by Ilgar Ilyasov on 3/26/19.
//  Copyright © 2019 Fun-the-mental. All rights reserved.
//


#import "IIIPersonSearchTableViewController.h"
#import "../Model Controller/IIIPersonController.h"
//#import "../Model/IIIPerson.h"
#import "../Views/IIIPersonTableViewCell.h"

// MARK: - Interface

// Any properties you want to be private, put in this interface (in the .m file)
@interface IIIPersonSearchTableViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end


// MARK: - Implementation

@implementation IIIPersonSearchTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _personController = [[IIIPersonController alloc] init];
        _people = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self searchBar] setDelegate: self];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self people] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IIIPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"PersonCell" forIndexPath: indexPath];
    
    IIIPerson *person = [[self people] objectAtIndex: [indexPath row]];
    [cell setPerson: person];
    
    return cell;
}

#pragma mark - UISearchBar Delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [[self personController] searchForPeopleWithSearchTerm:[searchBar text] completion:^(NSArray *people, NSError *error) {
        if (error) {
            NSLog(@"Error searching people");
            return;
        }
        
        if (people) {
            [[self people] setArray: people];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self tableView] reloadData];
        });
    }];
}

@end
