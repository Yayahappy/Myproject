//
//  TestView.h
//  My APP
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView

@property (nonatomic,strong) UIButton *btn;

@property (nonatomic,strong) void (^btnclick)(UIButton *btn);



-(id)initWithFrame:(CGRect)frame
              data:(id)data
         pageIndex:(NSInteger)index;

@end
