//
//  listViewController.m
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ListViewController.h"
#import "MZViewController.h"
#import "NameGroup.h"
#import "SectionHeaderView.h"
#import "Name.h"
#import "NTableViewCell.h"
#import "ResultTableViewController.h"
#import "NationViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger index;
}

//@property (nonatomic,strong) MZViewController *mzvc;

@property (nonatomic,strong) NSDictionary *dict;

@property (nonatomic,strong) NSArray *keys;

@property (nonatomic,strong) UIButton *btnback;

@property (nonatomic,strong) UIButton *btngo;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *names;

@property (nonatomic,strong) NSMutableArray *namegroups;

@property (nonatomic,strong) UISearchController *searchController;

@end

@implementation ListViewController

static NSString *identifier = @"cell";

//懒加载
-(NSArray *)names
{
    if (_names == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"names" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            NameGroup *nameGroup = [NameGroup nameGroupWithDictionary:dict];
            [models addObject:nameGroup];
        }
        _names = models;
    }
    return _names;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UIImage *image = [UIImage imageNamed:@"tab_community_normal@2x"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"民族" image:image tag:1];
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"民族";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;
    
     _tableView = tableView;

    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightBtnClick)];
    rightBarBtnItem.width = 30;
    rightBarBtnItem.tintColor = [UIColor blackColor];
    
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    ResultTableViewController *resultTableViewController =[[ResultTableViewController alloc] initWithStyle:UITableViewStylePlain];
    resultTableViewController.datas = self.names;
    _searchController = [[UISearchController alloc] initWithSearchResultsController:resultTableViewController];
    _searchController.searchResultsUpdater = resultTableViewController;
    _searchController.hidesNavigationBarDuringPresentation = YES;
    
    
}

//搜索
-(void)rightBtnClick
{
    [self presentViewController:_searchController animated:YES completion:nil];
}

#pragma mark -UITableViewDataSource
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.names.count;
}
//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NameGroup *nameGroup = self.names[section];
    
    if (nameGroup.isopen) {
        return nameGroup.nation.count;
    }
    return 0;
}

//单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[NTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    NameGroup *nameGroup = self.names[indexPath.section];
    Name *name = nameGroup.nation[indexPath.row];
    cell.name= name;
    
    //自定义辅助视图
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"go"]];
    cell.accessoryView = imageView;

    return cell;
}

//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NameGroup *nameGroup = self.names[section];
    return nameGroup.name;
}

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
   NameGroup *nameGroup = self.names[section];
    headerView.nameGroup = nameGroup;
    
    //刷新
    headerView.headerViewClick = ^{
        
        [tableView reloadData];
    };
    
    return headerView;
}

#pragma mark - UITableViewDelegate

//进入MZViewController
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MZViewController *mzvc = [[MZViewController alloc]init];
    
    index = indexPath.row;
    
    NSLog(@"%ld",(long)indexPath.row);

    //当indexPath.section为1时，B中的index均加1。
    if (indexPath.section == 1) {

        index += 1;

    }
    //KVC取值
    [mzvc setValue:@(index) forKey:@"indexpicture"];
    
    [self.navigationController pushViewController:mzvc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
