//
//  pageView.m
//  My APP
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "pageView.h"
#define DEFAULT_M34     -1.0/500 // 透视效果
#define pageView_pageheight 15
#define STEP1_DURATION 0.5
#define STEP2_DURATION 0.5

@implementation pageView

@synthesize pageViews,currentIndex,width,height,pageCtrl,initialized,delegate;


//初始化
-(id)initWithFrame:(CGRect)frame andsubViews:(NSArray *)views anddefaultIndex:(NSInteger)index anddelegate:(id)dele andshowPageCotrol:(BOOL)show
{
   if (self = [super initWithFrame:frame]) {
       self.pageViews = [[NSMutableArray alloc] initWithArray:views];
       //???????
       [self doInitWithFrame:frame andsubViews:self.pageViews anddefaultIndex:index anddelegate:dele andshowPageCotrol:show];
    }
    return self;
}

-(void)doInitWithFrame:(CGRect)frame andsubViews:(NSArray *)views anddefaultIndex:(NSInteger)index anddelegate:(id)dele andshowPageCotrol:(BOOL)show
{
    if (initialized) {
        return;
    }
    //???????
    if (!self.pageViews) {
        self.pageViews = [[NSMutableArray alloc] initWithArray:views];
        NSLog(@"%@",self.pageViews);
    }
    width = frame.size.width;
    height = frame.size.height;
    
    self.delegate = dele;
    
    //设置当前视图
    currentIndex = index;
    CGRect pageFrame = CGRectMake(0, 0, width, height);
    UIView *currentPage = [self.pageViews objectAtIndex:index];
    currentPage.frame = pageFrame;
    [self addSubview:currentPage];
    
    //设置左侧视图（前一页视图），索引小于当前视图索引
    CGFloat left = -width;
    
    for (NSInteger i = index-1; i>=0; i--) {
        UIView *page = [self.pageViews objectAtIndex:i];
        //??????
        page.clipsToBounds = YES;
        page.frame = CGRectMake(left, 0, width, height);
        [self addSubview:page];
        left -= width;
        
    }
    
    //设置右侧视图（后一页视图），索引大于当前视图索引的视图
    left = width;
    
    for (NSInteger i = index + 1; i<self.pageViews.count; i++) {
        
        UIView *page = [self.pageViews objectAtIndex:i];
        //
        page.clipsToBounds = YES;
        page.frame = CGRectMake(left, 0, width, height);
        [self addSubview:page];
        left += width;
        
    }
    
    //设置向右侧滑手势 及 触发事件
    UISwipeGestureRecognizer *rightSwipeGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeGestureAction:)];
    //手指方向
    rightSwipeGR.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:rightSwipeGR];
    
    //设置向左侧滑手势 及 触发事件
    UISwipeGestureRecognizer *leftSwipeGR =
        [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeGestureAction:)];
    //手指方向
    leftSwipeGR.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:leftSwipeGR];
    
    
    //
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0/500;
    self.layer.sublayerTransform = transform;
    
    self.initialized = YES;
    
}

#pragma  mark -- 滑动手势处理

//向右滑动
-(void)rightSwipeGestureAction:(UISwipeGestureRecognizer *)swipeGR
{
    //设置滑动动画效果
    if (currentIndex && currentIndex > 0) {
        
        //设置将要出现的视图的动画效果
        UIView *disPlayView = [pageViews objectAtIndex:currentIndex - 1];
        //
        __block CATransform3D displayTransform = CATransform3DIdentity;
        displayTransform.m34 = DEFAULT_M34;
        displayTransform = CATransform3DScale(displayTransform, 0.1, 0.1, 0.1);//设置缩放比例
        displayTransform = CATransform3DRotate(displayTransform, M_PI, 0, 1, 0);//后三个数字 分别代表以不同的转轴进行翻转，这里设置以y轴为旋转轴
        //设置动画效果
        disPlayView.frame = CGRectMake(-width, 0, width, height);
        disPlayView.layer.anchorPoint = CGPointMake(0.5, 0.5);//固定点，设置翻转时的中心点，0.5为视图layer的正中
        
        disPlayView.layer.transform = displayTransform;
        disPlayView.layer.shouldRasterize = YES;
        
        //设置将要消失视图的动画效果
        UIView *dismissView = [pageViews objectAtIndex:currentIndex];
        //
        __block CATransform3D dismissTransform = CATransform3DIdentity;
        //???????????
        dismissTransform.m34 = DEFAULT_M34;
        dismissTransform = CATransform3DScale(dismissTransform, 0.7, 0.7, 0.7);
        dismissView.layer.anchorPoint = CGPointMake(0.5, 0.5);
        dismissView.layer.transform = dismissTransform;
        dismissView.layer.shouldRasterize = YES;
        
       //设置动画效果
        
        //弯曲动画 缓和
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        //这里必须设置，修改上一步动画效果产生的二进制图片
        [UIView animateWithDuration:STEP1_DURATION animations:^{
            
            disPlayView.frame = CGRectMake(0, 0, width, height);

            displayTransform = CATransform3DScale(displayTransform, 5, 5, 5);//在原来的transform基础上缩放
            displayTransform = CATransform3DRotate(displayTransform, -1*5*M_PI/6, 0, 1, 0);//在原来的transform基础上旋转
            disPlayView.layer.transform = displayTransform;
            
            
            dismissView.frame = CGRectMake(width, 0, width, height);
            dismissTransform = CATransform3DScale(displayTransform, 0.1, 0.1, 0.1);
            dismissTransform = CATransform3DRotate(displayTransform, -M_PI, 0, 1, 0);
            dismissView.layer.transform = dismissTransform;
            //光栅化；点阵化；栅格化 ??????
            dismissView.layer.shouldRasterize = NO;
        
        } completion:^(BOOL finished){
            
            [UIView animateWithDuration:STEP2_DURATION animations:^(){
                
                    //使 显示视图 恢复正常，界面平行放置
                disPlayView.layer.transform = CATransform3DIdentity;
                disPlayView.layer.shouldRasterize = NO;
            }];
        }];
        
        currentIndex --;
        
    }
}

//向左滑动
-(void)leftSwipeGestureAction:(UISwipeGestureRecognizer *)swipeGR
{
    //设置滑动动画效果
    if (currentIndex < pageViews.count - 1 && currentIndex >= 0)
    {
        
        //设置将要出现的视图的动画效果
        UIView *disPlayView = [pageViews objectAtIndex:currentIndex + 1];//frame = (0 0; 320 460)
        disPlayView.frame = CGRectMake(width, 0, width, height);
        disPlayView.layer.anchorPoint = CGPointMake(0.5, 0.5);//固定点，设置翻转时的中心点，0.5为视图layer的正中
        //
        __block CATransform3D displayTransform = CATransform3DIdentity;
        displayTransform.m32 = DEFAULT_M34;
        displayTransform = CATransform3DRotate(displayTransform, -M_PI, 0, 1, 0);//后三个数字 分别代表以不同的转轴进行翻转，这里设置以y轴为旋转轴
        displayTransform = CATransform3DScale(displayTransform, 0.1, 0.1, 0.1);//设置缩放比例
        disPlayView.layer.transform = displayTransform;
        
        //出去栅格化， 点阵化
        disPlayView.layer.shouldRasterize = YES;
        
        //设置将要消失视图的动画效果
        UIView *dismissView = [pageViews objectAtIndex:currentIndex];
        
        __block CATransform3D dismissTransform = CATransform3DIdentity;
        dismissTransform.m34 = DEFAULT_M34;
        
        displayTransform = CATransform3DScale(displayTransform, 0.7, 0.7, 0.7);
       
        dismissView.layer.anchorPoint = CGPointMake(0.5, 0.5); //固定点
        dismissView.layer.transform = dismissTransform;
        dismissView.layer.shouldRasterize = YES;
        
        //必须设置，修改上一部动画效果产生的二进制图片
        [UIView animateWithDuration:STEP2_DURATION animations:^{
            
            disPlayView.frame = CGRectMake(0, 0, width, height);
            
            displayTransform = CATransform3DRotate(displayTransform, 5*M_PI/6, 0, 1, 0);
            displayTransform = CATransform3DScale(displayTransform, 5, 5, 5);
            
            disPlayView.layer.transform = displayTransform;//frame = (90.718 114.92; 138.564 230.16)
            
            dismissView.frame = CGRectMake(-width, 0, width, height);
            dismissTransform = CATransform3DRotate(dismissTransform, M_PI/2, 0, 1, 0);
            dismissTransform = CATransform3DScale(dismissTransform, 0.1, 0.1, 0.1);
            dismissView.layer.transform = dismissTransform;
            dismissView.layer.shouldRasterize = NO;
        
        } completion:^(BOOL finished){
            if ( finished )
            {
                [UIView animateWithDuration:STEP1_DURATION animations:^{
                    disPlayView.layer.transform = CATransform3DIdentity;//frame = (0 0; 320 460)
                } completion:^(BOOL finished){
                    if (finished)
                    {
                        //去掉栅格化点阵化效果
                        disPlayView.layer.shouldRasterize = NO;
                    }
                }];
            }
        }];
        
        //
    currentIndex ++;
        
        
    }
}

@end
