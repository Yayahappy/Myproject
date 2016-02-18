//
//  FirstViewController.m
//  My APP
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "FirstViewController.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height


@interface FirstViewController ()
{
    UIView *_animationBookCoverView;
}
@end

@implementation FirstViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationItem.title = @"中国民俗大全";
    self.view.backgroundColor = [UIColor purpleColor];
    //界面
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        _animationBookCoverView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"interface"]];
    }
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,kScreenW , kScreenH)];
    
    _animationBookCoverView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_animationBookCoverView];
    
    _animationBookCoverView.layer.anchorPoint = CGPointMake(0,0.5);
    _animationBookCoverView.center = CGPointMake(_animationBookCoverView.center.x- _animationBookCoverView.bounds.size.width/2.0f, _animationBookCoverView.center.y);
    
    [UIView beginAnimations:@"openBook" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished: context:)];
    [UIView setAnimationDuration:3.0];
    [UIView setAnimationDelay:0];
    
    CATransform3D _3Dt = CATransform3DIdentity;
    _3Dt = CATransform3DMakeRotation(M_PI/2.0, 0, -1, 0);
    _3Dt.m34 = 0.001f;
    
    _animationBookCoverView.layer.transform = _3Dt;
    [UIView commitAnimations];//动画
    
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag context:(void *)context
{
    [self.view removeFromSuperview];
}

@end
