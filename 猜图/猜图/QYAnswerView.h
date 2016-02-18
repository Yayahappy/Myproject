//
//  QYAnswerView.h
//  猜图
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYAnswerView : UIView

@property(nonatomic,strong) void (^btnclick)(UIButton *btn);

@property(nonatomic,strong) NSMutableArray *answerBtnIndexs;

+(instancetype)answerView:(NSInteger )count;

@end
