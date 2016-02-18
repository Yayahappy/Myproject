//
//  ViewController.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"
#import "FriendGroup.h"
#import "TableViewCell.h"
#import "SectionHeaderView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *heros;


@end

@implementation ViewController

-(NSArray *)heros
{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            FriendGroup *friendGroup = [FriendGroup friendGroupWithDictionary:dict];
            [models addObject:friendGroup];
        }
        _heros = models;
    }
    
    return _heros;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;
}

#pragma mark - UITableViewDataSource
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.heros.count;
}

//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FriendGroup *friendGroup = self.heros[section];
    if (friendGroup.isopen) {
        return friendGroup.friends.count;
    }
    return 0;
}

//单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    FriendGroup *friendGroup = self.heros[indexPath.section];
    Friend *friend = friendGroup.friends[indexPath.row];
    cell.friend = friend;
    return cell;
}

#if 0
//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    FriendGroup *friendGroup = self.heros[section];
    return friendGroup.name;
}
#endif
//section头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
//section头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   //创建自定义的section的头视图
    SectionHeaderView *headerView = [SectionHeaderView sectionHeaderViewForTableView:tableView];
    FriendGroup *friendGroup = self.heros[section];
    headerView.friendGroup = friendGroup;
    
    //刷新
    headerView.headerViewClick = ^{
        
        [tableView reloadData];
    };
    
    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
