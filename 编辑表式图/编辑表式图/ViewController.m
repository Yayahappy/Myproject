//
//  ViewController.m
//  编辑表式图
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableDictionary *dict;
@property (nonatomic,strong) NSArray *keys;

@end

@implementation ViewController

static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
   
    //加载数据
    [self loadDictFromFile];
    
    //注册单元格
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
}

-(void)editAction:(UIBarButtonItem *)item
{
    if ([item.title isEqualToString:@"编辑"]) {
        item.title = @"完成";
        [_tableView setEditing:YES animated:YES];
    }else{
           item.title = @"编辑";
        [_tableView setEditing:NO animated:YES];
    }
}

-(void)loadDictFromFile
{
    NSString *path =[[NSBundle mainBundle]pathForResource:@"sortednames" ofType:@"plist"];
    
    _dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    //取出key
    NSArray *array = _dict.allKeys;
    _keys = [array sortedArrayUsingSelector:@selector(compare:)];

}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = _keys[section];
    NSArray *array = _dict[key];
    return array.count;
}

//单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //取到当前section对应的索引
    NSString *key = _keys[indexPath.section];
    //取到当前section的行数据
    NSArray *array = _dict[key];
    //当前单元格对应的数据
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}

//设置section的头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _keys[section];
}
//索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
