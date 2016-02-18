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

@interface DBListViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation DBListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [self addSubView];
    
    
    //1.判断本地是否有缓存数据
    
      //读取本地缓存
       
    //2.读取本地缓存
    
    //3.进行网络请求 异步
    
    [self loadDataFromNet];
    //4.添加视图
    
    
}

-(void)addSubView
{
    UIBarButtonItem *BarbtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContent)];
    self.navigationItem.rightBarButtonItem = BarbtnItem;
    

    UISearchBar *searchBar = [[UISearchBar alloc] init];
    
    searchBar.delegate = self;
    
    _tableView.tableHeaderView = searchBar;
}

-(void)addContent
{
    
}
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
        
      NSMutableArray *tempArr = responseObject[@"data"];
        
      self.dataArr = [NSMutableArray array];
        
    for (NSDictionary *dic in tempArr)
     {
         Students *stu = [[Students alloc] initWithDic:dic];
         [self.dataArr addObject:stu];
         
         //更新UI
         [_tableView reloadData];
         
         
     }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"==error==");
    }];
    
}

@end
