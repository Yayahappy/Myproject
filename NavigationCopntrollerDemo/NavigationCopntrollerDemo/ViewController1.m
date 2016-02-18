//
//  ViewController1.m
//  NavigationCopntrollerDemo
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 80, 100, 40)];
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationController.navigationItem .leftBarButtonItem = leftBarBtnItem;
}

-(void)back:(UIButton *)btn
{
    UIViewController *vc = self.navigationController.viewControllers[0];
    [self.navigationController popToViewController:vc animated:YES];
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
