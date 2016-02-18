//
//  ViewController.m
//  卡不卡1
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *text1;
@property (weak, nonatomic) IBOutlet UILabel *text2;

@end

#define QYScreenW [UIScreen mainScreen].bounds.size.width

#define sand   int x = arc4random() % 380;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _text1.backgroundColor = [UIColor brownColor];
    _text2.backgroundColor = [UIColor yellowColor];
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationCurve:0];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:LONG_MAX];
    _text2.frame = CGRectMake(QYScreenW -80, 300, 80, 50);
    [UIView commitAnimations];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
