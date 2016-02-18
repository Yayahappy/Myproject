//
//  ViewController.m
//  咖啡
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "FirstVC.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface FirstVC ()

@property (nonatomic,strong) UIImageView *backImage;

@end

@implementation FirstVC

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UIImage *image = [UIImage imageNamed:@"tab_community_normal@2x"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"精品咖啡" image:image tag:1];
        self.tabBarItem = tabBarItem;

    }
    //设置图片数量
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgi"]];
    
    _backImage.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    
    [self.view addSubview:_backImage];
    
    self.navigationItem.title = @"精品咖啡";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
