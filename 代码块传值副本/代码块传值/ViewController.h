//
//  ViewController.h
//  代码块传值
//
//  Created by qingyun on 15/11/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"

@interface ViewController : UIViewController

@property (nonatomic,strong)void (^black)(NSString *);

@end

