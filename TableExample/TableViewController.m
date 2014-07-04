//
//  TableViewController.m
//  Tables
//
//  Created by Michael Snowden on 7/4/14.
//  Copyright (c) 2014 Michael Snowden. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) NSMutableArray *searchResults;
// a change was made

@end

@implementation TableViewController

- (void)viewDidLoad
{
    _data = @[@"One", @"Two", @"Three", @"Four", @"Five"];
    _searchResults = [NSMutableArray arrayWithCapacity:_data.count];
}

- (void)filterResults:(NSString *)searchTerm {

    [self.searchResults removeAllObjects];

    for (NSString *string in _data)
    {
        if ([[string lowercaseString] hasPrefix:[searchTerm lowercaseString]])
        {
            [self.searchResults addObject:string];
        }
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:  (NSString *)searchString {
    [self filterResults:searchString];
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (tableView == self.tableView) ? _data.count : _searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"reuseIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    NSString *string = (tableView == self.tableView) ? _data[indexPath.row] : _searchResults[indexPath.row];
    cell.textLabel.text = string;
    return cell;
}

@end
