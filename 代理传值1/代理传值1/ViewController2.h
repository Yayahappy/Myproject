//
//  ViewController2.h
//  代理传值1
//
//  Created by qingyun on 15/11/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "move.h"
@interface ViewController2 : UIViewController

@property(nonatomic,assign)id <move> delegate;

@end
