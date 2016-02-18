//
//  DBListViewController.m
//  FMDB。Demo
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "DBListViewController.h"
#import "DBFileHandel.h"
#import "Header.h"
#import "Students.h"
#import "InsertViewController.h"

@interface DBListViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;

@property (nonatomic,strong) UIRefreshControl *refreshControl;

@end

@implementation DBListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //1.判断本地是否有缓存数据
    NSString *issave = [[NSUserDefaults standardUserDefaults] objectForKey:ISSAVE];
    if (issave)
    {
         //读取本地缓存
        NSMutableArray *temp = [[DBFileHandel shareHandel] selectDataAll];
        if (temp)
        {
            self.dataArr = temp;
        }
    }
    else
    {
        //3.进行网络请求 异步
        [self loadDataFromNet];
    }
       //4.添加视图
    [self addSubView];
    
}

-(void)addSubView
{
    UIBarButtonItem *BarbtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContent)];
    self.navigationItem.rightBarButtonItem = BarbtnItem;
    
  //添加搜索
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
    searchBar.delegate = self;
    
    _tableView.tableHeaderView = searchBar;
    
  //添加下拉刷新控件
    _refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.attributedTitle=[[NSAttributedString alloc] initWithString:@"下拉刷新..."];
    [_refreshControl addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [_tableView addSubview:_refreshControl];
    
    
}

-(void)changeValue:(UIRefreshControl *)control
{
    if (control.isRefreshing)
    {
        control.attributedTitle = [[NSAttributedString alloc] initWithString:@"正在加载..."];
        
        [self loadDataFromNet];
    }

}

-(void)addContent
{
    InsertViewController *insertVC = [[InsertViewController alloc]init];
    
    [self.navigationController pushViewController:insertVC animated:YES];
}

//-(void)endRefresh
//{
//    _refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新..."];
//}

#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Students *model = _dataArr[indexPath.row];
    
    cell.textLabel.text = model.name;
    
    return cell;
}

-(void)endRefresh{
    _refreshControl.attributedTitle=[[NSAttributedString alloc] initWithString:@"下拉刷新..."];
}

#pragma mark 网络请求
-(void)loadDataFromNet
{
   //1.进行网络请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置参数
    NSDictionary *dict = @{@"person_type":@"student"};
    
    [manager POST:URLPATH parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //请求成功
        NSLog(@"==%@==",responseObject);
        
      NSArray *tempArr = responseObject[@"data"];
        
      self.dataArr = [NSMutableArray array];
        
    for (NSDictionary *dic in tempArr)
     {
         Students *stu = [[Students alloc] initWithDic:dic];
         
         [self.dataArr addObject:stu];
     }
         //更新UI
         [_tableView reloadData];
        
        //若ISSAVE设置过值，说明当前为请求下拉刷新，需要清空当前列表，重写数据
        if ([[NSUserDefaults standardUserDefaults] objectForKey:ISSAVE])
        {
          //删除上次请求的数据
            if ([[DBFileHandel shareHandel] deleteDataAll])
            {
                NSLog(@"删除完成");
            }
            [_refreshControl endRefreshing];
            [self performSelector:@selector(endRefresh) withObject:nil afterDelay:1];
        }
        
        //缓存数据到数据库
        for (Students *model in self.dataArr)
        {
            //存到数据库
            [[DBFileHandel shareHandel] insertDataFrom:model];
        }
        //设置已经保存过
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:ISSAVE];
        //持久化同步
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        //请求失败
        NSLog(@"==error=请求失败=");
        
        [_refreshControl endRefreshing];
        
        [self performSelector:@selector(endRefreshing) withObject:nil afterDelay:1];
    }];
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //添加操作
    if (editingStyle == UITableViewCellEditingStyleInsert)
    {
       // Students *model0 = _dataArr[indexPath.row];
        
       // [self.dataArr insertObject:<#(nonnull id)#> atIndex:<#(NSUInteger)#>];
        
    }
    
    //删除操作
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //将数据放入模型
        Students *model = _dataArr[indexPath.row];
        //删除数据源
        [self.dataArr removeObjectAtIndex:indexPath.row];
        //删除表
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        //删除数据库
        if ([[DBFileHandel shareHandel] deleteDataFromStu_id:model.stu_id])
        {
            NSLog(@"删除成功");
        }
    }
}

#pragma mark UISearchBarDelegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    return YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    
    [searchBar resignFirstResponder];
    
    NSMutableArray *temp = [[DBFileHandel shareHandel] selectDataFromWithName:searchBar.text];
    if (temp) {
        
        self.dataArr = temp;
        
        [_tableView reloadData];
    }
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"++%@++",searchBar.text);
    
    if (searchBar.text.length == 0)
    {
        NSMutableArray *tempArr = [[DBFileHandel shareHandel] selectDataAll];
        
        NSLog(@"1232");
    
        if (tempArr)
        {
            self.dataArr = tempArr;
        }
        [_tableView reloadData];
    }    
    else
    {
        NSMutableArray *tempArr = [[DBFileHandel shareHandel] selectDataFromWithName:searchBar.text];
        
        NSLog(@"3456");
        
        if (tempArr)
        {
            self.dataArr = tempArr;
           [_tableView reloadData];
        }
    }
    
}

@end
