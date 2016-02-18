//
//  moveScrollView.m
//  My APP
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "moveScrollView.h"

@interface moveScrollView()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSArray *imageArray;//图片数组
@property (nonatomic) CGRect viewSize;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic) NSInteger currentPageIndex;
@property (nonatomic,strong) NSTimer *timer;

@end
@implementation moveScrollView

- (void)setRect:(CGRect)rect ImageArray:(NSArray *)imageArray
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:imageArray];
    
    [tempArray addObject:[imageArray firstObject]];
    self.imageArray = tempArray;
    self.viewSize = rect;
    NSInteger pageCount = self.imageArray.count;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.viewSize.size.width, self.viewSize.size.height)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.viewSize.size.width * pageCount, self.viewSize.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    
    self.scrollView.delegate = self;
    
    for (int i = 0; i<pageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:self.imageArray[i]];
        imageView.frame = CGRectMake(self.viewSize.size.width * i, 0, self.viewSize.size.width, self.viewSize.size.height);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentOffset = CGPointMake(0, 0);
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(140,80,100,20)];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.imageArray.count-1 ;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [self addSubview:self.scrollView];
    [self addSubview:_pageControl];
    
}

- (instancetype)initWithRect:(CGRect)rect ImageArray:(NSArray *)imageArray
{
    if (self = [super initWithFrame:rect]) {
        [self setRect:rect ImageArray:imageArray];
    }
    return self;
}

- (void)setTimeInterVal:(NSTimeInterval)timeInterVal
{
    _timeInterVal = timeInterVal;
    if (_timeInterVal>0) {
        [self addTimer];
    }
}
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterVal target:self selector:@selector(imagesAutoRun) userInfo:nil repeats:YES];
    
}

- (void)imagesAutoRun
{
    
    NSInteger nextPageIndex = self.currentPageIndex+1;
    [self.scrollView setContentOffset:CGPointMake(self.viewSize.size.width * nextPageIndex, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    
    NSInteger page = scrollView.contentOffset.x/pageWidth;
    
    self.currentPageIndex = page;
    
    if (self.currentPageIndex == self.imageArray.count - 1) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.pageControl.currentPage = 0;
        
    }
    self.pageControl.currentPage = self.currentPageIndex;
    
    
}
@end
