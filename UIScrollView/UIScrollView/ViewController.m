//
//  ViewController.m
//  UIScrollView
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //   _ScrollView.backgroundColor = [UIColor greenColor];
    
   //设置ScrollView内容的大小
    _ScrollView.contentSize = _ImageView.frame.size;
   
   //设置偏移量
  //  _ScrollView.contentOffset = CGPointMake(100, 100);
    
   //更改滚动区域
  //  _ScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //锁定方向
 //   _ScrollView.directionalLockEnabled = YES;
    
    //默认是 yes，就是滚动超过边界会反弹有反弹回来的效果。假如是 NO，那么滚动到达边界会立刻停止。

  //  _ScrollView.bounces = YES;
    
    //默认是no，假如是yes并且bounces是yes,如果内容大小小于bounds的时候，允许垂直拖动.  alwaysBounceHorizontal垂直时相同
   // _ScrollView.alwaysBounceVertical = YES;
    
    //显示Horizontal垂直滚动条
 //   _ScrollView.showsHorizontalScrollIndicator = NO;
    
    //滚动条的样式,总共3个颜色：默认、黑、白
  //  _ScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
    //设置减速
//    _ScrollView.decelerationRate = 100;
    
    //属性滚动到顶部
    //scrollsToTop和scrollViewShouldScrollToTop或只存在一个时，存在的均为YES，点击顶部才可以到达顶部。
    _ScrollView.scrollsToTop = YES;
    
    _ScrollView.delegate = self;
    
}

#pragma mark - UIScrollViewDelegate

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    //允许到达顶部
    return YES;
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"到达顶部了，需要网络请求，刷新界面");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
