//
//  QYAnswerView.m
//  猜图
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYAnswerView.h"

@implementation QYAnswerView
#define QYScreenw [UIScreen mainScreen].bounds.size.width
+(instancetype)answerView:(NSInteger )count
{
    QYAnswerView *answerView = [[QYAnswerView alloc] initWithFrame:CGRectMake(0,0, QYScreenw, 40)];
    
    answerView.backgroundColor = [UIColor redColor];
    
   // NSLog(@"234");
    //根据count的数量，创建不同个数的btn
    for (int i=0; i<count; i++) {
        CGFloat btnW = 40;
        CGFloat btnH = 40;
        CGFloat btnSpace = 20;//设置 间距btnSpace
        
        //设置第一个btn离左边缘的距离，和最后一个btn离右边缘的距离
        CGFloat baseX =(QYScreenw - btnW*count-(count-1)*btnSpace)/2;
        
        CGFloat btnX =baseX+i*(btnW+btnSpace) ;
        CGFloat btnY =0;

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [answerView addSubview:btn];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
      //  [answerView addSubview:btn];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn addTarget:answerView action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return answerView;
}

-(void)btnClick:(UIButton *)btn
{
    if (_btnclick) {
        _btnclick(btn);
    }
}

-(NSMutableArray *)answerBtnIndexs
{
   
    if (_answerBtnIndexs == nil) {
        _answerBtnIndexs = [NSMutableArray array];
        for (int i = 0; i<self.subviews.count; i++) {
            //把需要填写的btn的下标添加在_answerBtnIndexs中
            [_answerBtnIndexs addObject:@(i)];
        }
    }
    return _answerBtnIndexs;
}

-(void)setFrame:(CGRect)frame
{
   //1,获取初始化时answerView的originframe
    CGRect originFrame = self.frame;
   //2,根据传过来的frame更改originframe的位置
    originFrame.origin = frame.origin;
   //3，把更改过后的originframe设置成当前answerview的frame
    [super setFrame:originFrame];
        
}


@end
