//
//  ViewController.m
//  UIPageControl
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    
    [self.view addSubview:page];
    
    page.backgroundColor = [UIColor yellowColor];
    
    page.numberOfPages = 6;
    page.currentPage = 2;
    
   // page.hidesForSinglePage = YES;
    
    page.pageIndicatorTintColor = [UIColor purpleColor];
    
    page.currentPageIndicatorTintColor = [UIColor greenColor];
    
    page.defersCurrentPageDisplay = YES;
    
    [page addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pageClick:(UIPageControl *)page
{
    [page performSelector:@selector(updateCurrentPageDisplay) withObject:nil afterDelay:1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
