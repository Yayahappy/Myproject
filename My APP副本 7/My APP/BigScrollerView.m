//
//  BigScrollerView.m
//  My APP
//
//  Created by qingyun on 15/12/22.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "BigScrollerView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@implementation BigScrollerView

-(instancetype)initBigScrollView
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 90, kScreenWidth, kScreenHeight-90);
        self.contentSize = CGSizeMake(kScreenWidth*3, 0);
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}
@end
