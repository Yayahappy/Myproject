//
//  ViewController.m
//  索引标示图
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSDictionary *dict;
@property (nonatomic,strong) NSArray *keys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDictFromFile];

    //加载数据
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;
    
    //当行书超过sectionIndexMinmumDisplayRowCount的时候显示右边的索引
    tableView.sectionIndexMinimumDisplayRowCount = 1000;
    //索引文本的颜色
    tableView.sectionIndexColor = [UIColor grayColor];
    //背景颜色
    tableView.sectionIndexBackgroundColor = [UIColor yellowColor];
    //选中背景颜色
    tableView.sectionIndexTrackingBackgroundColor = [UIColor purpleColor];
    
}

-(void)loadDictFromFile
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"sortednames" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //取出字典中的所有键
    NSArray *keys = _dict.allKeys;
    //排序
    _keys = [keys sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark - UITableViewDataSource
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}

//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //先取出section对应的key
    NSString *key = _keys[section];
    //取section对应的数据
    NSArray *array = _dict[key];
    return array.count;
}

//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString *key = _keys[indexPath.section];
    NSArray *array = _dict[key];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

//section头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _keys[section];
}

//设置索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

//点击索引视图上的section的索引
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (index == 0) {
        return index +1;
    }
    return index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
