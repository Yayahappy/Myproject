//
//  ResultTableViewController.m
//  My APP
//
//  Created by qingyun on 15/12/10.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ResultTableViewController.h"
#import "NTableViewCell.h"
#import "Name.h"
#import "NameGroup.h"

@interface ResultTableViewController ()

@property (nonatomic,strong) NSArray *results;
@property (nonatomic,strong) UISearchBar *searchBar;
@end

@implementation ResultTableViewController

static NSString *identifier = @"cell";

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *filterString = searchController.searchBar.text;
    //谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[cd] %@",filterString];
    NSMutableArray *array = [NSMutableArray array];
    for (NameGroup *group in _datas) {
        NSArray *filterArray = [group.nation filteredArrayUsingPredicate:predicate];
        [array addObjectsFromArray:filterArray];
    }
    _results = array;
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    [self.tableView.tableHeaderView addSubview: _searchBar];
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"fitlerCell";
    
    NTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    Name *name = _results[indexPath.row];
    cell.name = name;
    
    return cell;
}


@end
