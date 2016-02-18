//
//  SZViewController.m
//  WeiXin
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "SZViewController.h"

@interface SZViewController ()

@end

@implementation SZViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:uit tag:1];
        UIImage *image1 = [UIImage imageNamed:@"tabbar_me@2x"];
        UIImage *image2 = [UIImage imageNamed:@"tabbar_meHL@2x"];
        
        
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:image1 selectedImage:image2];
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
