//
//  ViewController1.m
//  NavigationController
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController1.h"

@implementation ViewController1

- (IBAction)back:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
