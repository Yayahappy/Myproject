//
//  ViewController.m
//  NavigationController
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)rightBarBtnItemClick:(UIBarButtonItem *)sender {
    NSLog(@"拍照");
}
- (IBAction)leftBarBtnItemClick:(UIBarButtonItem *)sender {
    NSLog(@"菜单");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
