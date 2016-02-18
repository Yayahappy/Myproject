//
//  ViewController.m
//  UIView
//
//  Created by qingyun on 15/11/11.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建view1
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 280, 500)];
    view1.backgroundColor = [UIColor redColor];
    //alpha的值范围（0~1）
    view1.alpha = 0.3;
    //增加子视图
    [self.view addSubview:view1];
    
    
    //创建view2
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 200, 650)];
    view2.backgroundColor = [UIColor yellowColor];
    //view2.alpha = 0.3;
    [self.view addSubview:view2];
    
    //view2.hidden = NO;
    
    //输出视图的集合
    //NSLog(@"<<view2>>%@",view2.superview);
    
    //移除子视图
    //[view2 removeFromSuperview];

    //创建子视图
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 250, 550)];
    view3.backgroundColor = [UIColor blueColor];
    //view3.alpha = 0.2;
    
    //0，1，2在最下面，3在中间，4在上面
  //  [self.view insertSubview:view3 atIndex:3];
    
    //增加子视图
    [self.view addSubview:view3];
    
    //增加到view3时才不能超出view3的边界
    view3.clipsToBounds = YES;
    NSLog(@"<<self.view>>%@",self.view.subviews);
    
    //交换view1和view2的位置
    [self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:2];
    //[self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:4];
    NSLog(@"<<self.view>>%@",self.view.subviews);
    
    
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 400, 300)];
    view4.backgroundColor = [UIColor brownColor];
    //将view4插入view3的下方
    //[self.view insertSubview:view4 belowSubview:view3];
   // [view3 addSubview:view4];
    
    
//    //把view1添加在最下面
//    [self.view bringSubviewToFront:view1];
//    //把view1添加在最上面
//    [self.view sendSubviewToBack:view1];
    
    
    
}

//所有改变了的图片还原
//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
