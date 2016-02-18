//
//  ViewController.m
//  TableViewDemo
//
//  Created by qingyun on 15/12/1.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width

//#define kScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *arr;
@end

@implementation ViewController

-(NSArray *)arr
{
    if (_arr == nil) {
        
        _arr = @[@"1",@"2",@"3"];
    }
    return _arr;

}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    //创建并添加UITableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    //设置数据源
    tableView.dataSource = self;
    //设置代理
    tableView.delegate = self;
    
    //设置背景
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:tableView.frame];
    bgView.image = [UIImage imageNamed:@"0"];
    tableView.backgroundView = bgView;
    
    //设置头视图
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,kScreenW, 100)];
    headerLabel.text = @"TableViewHeaderView";
    headerLabel.textAlignment = NSTextAlignmentCenter;
    
    headerLabel.backgroundColor = [UIColor purpleColor];

    headerLabel.font = [UIFont boldSystemFontOfSize:26];
    tableView.tableHeaderView = headerLabel;
    
    //设置尾视图
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
    footerLabel.textAlignment = NSTextAlignmentCenter;
    footerLabel.text = @"TableViewFooterView";
    footerLabel.backgroundColor = [UIColor yellowColor];
    footerLabel.font = [UIFont boldSystemFontOfSize:26];
    tableView.tableFooterView = footerLabel;
    
    /*section
     1、高度的设置（属性，代理方法）
     2、设置头尾的标题
     3、设置头尾的视图
     注意：设置头尾视图的时候，如果当前的tableview的样式是UITableViewStyleGrouped，那么必须使用代理方法设置高度，如果tableview的样式是UITableViewStylePlain,属性和代理方法都可以设置高度
     */
    tableView.sectionFooterHeight = 100;
    tableView.sectionHeaderHeight = 100;
    
    //设置行高
    tableView.rowHeight = 51;
    
    //分割线
    //样式
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    //颜色
    tableView.separatorColor = [UIColor greenColor];
    
    //缩进
    tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    
    //选中
  //  tableView.allowsMultipleSelection = YES;
    

}

#pragma mark - UITableViewDataSource

//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//组中的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"p"];
    
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
}
//section尾标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionFooterView:%ld",section];
}

#pragma mark - UITableViewDelegate
//section的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionHeaderLabel = [[UILabel alloc] init];
    sectionHeaderLabel.text = [NSString stringWithFormat:@"SectionHeaderView:%ld",section];
    sectionHeaderLabel.textAlignment = NSTextAlignmentCenter;
    
    return sectionHeaderLabel;
}

//section的尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *sectionFooterLabel = [[UILabel alloc] init];
    sectionFooterLabel.text = [NSString stringWithFormat:@"SectionFooterView:%ld",section];
    sectionFooterLabel.textAlignment = NSTextAlignmentCenter;
    
    return sectionFooterLabel;
}

//设置section的头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

//设置section的尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2 != 0) {
        return 50;
    }
    return 50;
}

//Selection
//允许高亮显示选中
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor redColor];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryNone;
}
@end
