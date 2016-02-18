//
//  ViewController.m
//  NavigationCopntrollerDemo
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor purpleColor];
    //导航栏透明度
    self.navigationController.navigationBar.translucent = NO;
    //显示工具栏
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    btn.frame = CGRectMake(100, 80, 100, 40);
    
    [btn addTarget:self action:@selector(gotov1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self setNavigationBar];
    [self setToolbar];
    
}

-(void)gotov1:(UIButton *)btn
{
    ViewController1 *v1 = [[ViewController1 alloc] init];
    [self.navigationController pushViewController:v1 animated:YES];
}

-(void)setNavigationBar
{
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    UIBarButtonItem *liftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:nil];
  
    self.navigationItem.leftBarButtonItem = liftBarBtnItem;
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    UIImage *image = [UIImage imageNamed:@"bgimgae"];
    [self.navigationController.navigationBar setBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(50, 4, 6, 3) resizingMode:UIImageResizingModeTile] forBarMetrics:UIBarMetricsDefault];
    
    //用于控制显示栏的出现和消失
    [self.navigationController setHidesBarsOnTap:YES];
    
   
}

-(void)setToolbar
{
    self.navigationController.toolbarHidden = NO;
    
    NSArray *array = @[@"first",@"second",@"third"];
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:array];
    self.navigationItem.titleView = segmented;
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"联系人" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"消息" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"通知" style:UIBarButtonItemStylePlain target:self action:nil];
    

    //
    UIBarButtonItem *fixedSpaceBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    fixedSpaceBarBtnItem.width = 60;
    UIBarButtonItem *fiexiblespaceBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgimgae"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    NSArray *arr = @[fixedSpaceBarBtnItem,item1,fiexiblespaceBarBtnItem,item2,fiexiblespaceBarBtnItem,item3,fixedSpaceBarBtnItem];
    [self setToolbarItems:arr animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
