//
//  ViewController.m
//  FMDB。Demo
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "DBListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(40, 200, 300, 40)];
    [btn setTitle:@"Next" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor purpleColor];
    
    [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

-(void)BtnClick
{
    DBListViewController *listVC = [[DBListViewController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
}


@end
