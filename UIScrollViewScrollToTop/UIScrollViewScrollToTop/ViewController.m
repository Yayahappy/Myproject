//
//  ViewController.m
//  UIScrollViewScrollToTop
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    _scrollView.contentSize = _imageView.frame.size;
    
   // _scrollView.scrollsToTop = YES;
    
    _scrollView.delegate = self;
    
    [_scrollView setContentOffset:CGPointMake(100, 0) animated:YES];
    
    //缩放比例范围
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 0.1;

    
}

#pragma  make - UIScrollViewDelegate 滚动

#if 0

//任何位移改变
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"decelerating:%d",scrollView.decelerating);
}

//将要开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"tracking:%d",scrollView.tracking);
 }

//将要结束拖动
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"%s",__func__);
    NSLog(@"velocity:%@",NSStringFromCGPoint(velocity));
    
    NSLog(@"targetContentOffset:%@",NSStringFromCGPoint(*targetContentOffset));

}

//已经结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"%s",__func__);

}

//将要开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);

}

//已经结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);

}

//
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);

}

#endif
//
#pragma make - UIScrollViewDelegate 缩放

//缩放过程中调用（不止一次）
//-(void)scrollViewDidZoom:(UIScrollView *)scrollView
//{
//
//}


//-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
//{
//
//    NSLog(@"1");
//    return YES;
//}

//缩放过程中调用（不止一次）
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView
//{
//    NSLog(@"zoomScale:%f",scrollView.zoomScale);
//    //NSLog(@"zooming:%d",scrollView.zooming);
//    
//}
////指定当前缩放的视图
//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return _imageView;
//}
//
////将要开始缩放
//- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
//{
//    NSLog(@"将要开始:%d",scrollView.zooming);
//}
//
////已经完成缩放
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
//{
//    NSLog(@"已经结束:%d",scrollView.zooming);
//    NSLog(@"zoomBouncing:%d",scrollView.zoomBouncing);
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
//{
//    NSLog(@">><<");
//}

@end
