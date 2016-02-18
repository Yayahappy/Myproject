//
//  QYOptionView.m
//  猜图
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYOptionView.h"

@implementation QYOptionView

+(instancetype)OptionView
{
   //
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"View" owner:nil options:nil];
    return views[0];
}

-(void)setBtnTitles:(NSArray *)btnTitles
{
    for (int i=0; i<btnTitles.count; i++) {
        //
        UIButton *btn = self.subviews[i];
        
        [btn setTitle:btnTitles[i] forState:UIControlStateNormal];
        
        //
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:18]];
        
        //
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

        
    }
}

-(void)btnClick:(UIButton *)btn
{
    if (_btnClick) {
        _btnClick(btn);
    }
}
-(void)setFrame:(CGRect)frame
{
    CGRect originFrame = self.frame;
    originFrame.origin = frame.origin;
    [super setFrame:originFrame];
}
@end
