//
//  ViewController.m
//  YWeiBo
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabbar
    self.tabBar.tintColor = [UIColor orangeColor];
    
    self.selectedIndex = 2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
