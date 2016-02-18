//
//  ViewController2.h
//  代码块传值
//
//  Created by qingyun on 15/11/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewController2 : UIViewController

@property (nonatomic,strong)void (^block)(NSString *);

@end
