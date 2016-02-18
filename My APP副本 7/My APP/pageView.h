//
//  pageView.h
//  My APP
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

//页面图管理协议
@protocol pageViewDelegate <NSObject>

@optional

//@page:已显示的页对象
//@index:序号
-(void)didshowPage:(id)page andatIndex:(NSInteger)index;

//尝试显示大于最大序号的页
-(void)willOverUpbound;

//尝试显示小于最小序号的页
-(void)willOverLowbound;

@end

/*
具有左右滑动切换子视图的视图类
*/
@interface pageView : UIView <UIScrollViewDelegate>

//当前页序号
@property (nonatomic) NSInteger currentIndex;

//宽度
@property (nonatomic) CGFloat width;

//高度
@property (nonatomic) CGFloat height;

//页控件对象
@property (nonatomic,strong) UIPageControl *pageCtrl;

//是否已经初始化
@property BOOL initialized;

//页组数
@property (nonatomic,strong) NSMutableArray *pageViews;

//委托
@property (weak) id <pageViewDelegate> delegate;

/*
 @param frame 该视图在父视图中的区域
 @param views 子视图列表，UIView成员
 @param index 默认显示的子视图的标签
 @param dele 符合pageViewDelegate的对象
*/
-(id)initWithFrame:(CGRect)frame
        andsubViews:(NSArray *)views
        anddefaultIndex:(NSInteger)index
        anddelegate:(id)dele
        andshowPageCotrol:(BOOL)show;
/**
 * 初始化
 * @param frame 该视图在父视图中的区域
 * @param views 子视图列表，UIView成员
 * @param index 默认显示的子视图
 * @param dele 符合pageViewDelegate的对象
 * @param show 是否显示页控件
**/
-(void)doInitWithFrame:(CGRect)frame
        andsubViews:(NSArray*)views
        anddefaultIndex:(NSInteger)index
           anddelegate:(id)dele
     andshowPageCotrol:(BOOL)show;

//向右滑动
-(void)rightSwipeGestureAction:(UISwipeGestureRecognizer *)swipeGR;
//向左滑动
-(void)leftSwipeGestureAction:(UISwipeGestureRecognizer *)
    swipeGR;


@end



