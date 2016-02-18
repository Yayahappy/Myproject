//
//  ViewController.m
//  WeiXin
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Models.h"
#import "TableViewCell.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height
#define ImageViewCount 3

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong) NSMutableArray *datas;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableDictionary *dict;
@property (nonatomic,strong) NSArray *keys;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchController *searchController;//搜索控制器

@end

@implementation ViewController

static NSString *identifier = @"cell";

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UIImage *image1 = [UIImage imageNamed:@"tabbar_mainframe@2x"];
        UIImage *image2 = [UIImage imageNamed:@"tabbar_mainframeHL@2x"];

        
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"团购" image:image1 selectedImage:image2];
        self.tabBarItem = tabBarItem;
    }
    return self;
}

//懒加载
-(NSMutableArray *)datas
{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            Models *model = [Models modelWithDict:dict];
            [models addObject:model];
        }
        
        _datas = models;
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,120, KScreenW, KScreenH) style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.rowHeight = 120;
    
    _tableView = tableView;
    
    self.navigationItem.title = @"团购";
    
    //navigation透明度
    self.navigationController.navigationBar.translucent = NO;
    
    [self addScrollerView];
    
    [self addContentForScrollView];
    
    //加载数据
    [self loadDictFromeFile];
    
    
    //注册单元格 ????????
    [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    //左边的UIBarBtuttonItem
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    
}

//编辑 逻辑
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

//添加搜索


-(void)addScrollerView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 120)];
    [self.view addSubview:scrollView];
    
    //设置contentsize
    scrollView.contentSize =CGSizeMake(scrollView.frame.size.width*ImageViewCount,120);
    //分页
    scrollView.pagingEnabled = YES;
   
    _scrollView = scrollView;
    
    //锁定方向
    _scrollView.directionalLockEnabled = YES;
    
    //
    _scrollView.showsVerticalScrollIndicator = NO;
}

//添加滚动内容
-(void)addContentForScrollView
{
    for (int i = 0; i < ImageViewCount; i++) {
        UIScrollView *scroView = [[UIScrollView alloc] initWithFrame:CGRectMake(KScreenW*i, 0, KScreenW, 120)];
        [_scrollView addSubview:scroView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenW, 120)];
        [scroView addSubview:imageView];
        
        //设置图片
        NSString *imagename = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:imagename];
        
        //设置代理
        scroView.delegate = self;
        
    }
}
//编辑
-(void)loadDictFromeFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    _dict = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    //取出key
    NSArray *array = _dict.allKeys;
    _keys = [array sortedArrayUsingSelector:@selector(compare:)];
}




#pragma mark - UITableViewDataSource

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //?????????
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier]; //forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil][0];
//    }
    Models *model = self.datas[indexPath.row];
    
    cell.datas = model;
    
    return cell;
}

#pragma mark -删除
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//设置当前单元格的编辑样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//提交编辑状态
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //编辑状态为删除状态
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //更改数据源
     //   [array removeObjectAtIndex:indexPath.row];
        [self.datas removeObjectAtIndex:indexPath.row];
        //更改界面
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

#pragma mark 编辑--移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
     Models *model = self.datas[sourceIndexPath.row];
    
    //把移除的单元格内容移除
    [self.datas removeObjectAtIndex:sourceIndexPath.row];
  
    [self.datas insertObject:model atIndex:destinationIndexPath.row];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
