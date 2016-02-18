//
//  moveScrollView.h
//  My APP
//
//  Created by qingyun on 15/12/9.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface moveScrollView : UIView

@property (nonatomic) NSTimeInterval timeInterVal;

- (instancetype)initWithRect:(CGRect)rect ImageArray:(NSArray *)imageArray;

- (void)setImageArray:(NSArray *)imageArray;

@end
