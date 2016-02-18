//
//  SmallScrollerView.h
//  My APP
//
//  Created by qingyun on 15/12/24.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmallScrollerView : UIScrollView

@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic,strong) void (^changeIndexValue)(NSInteger);

-(instancetype)initWithButtonArr:(NSArray *)arr;

@end
