//
//  QYOptionView.h
//  猜图
//
//  Created by qingyun on 15/11/20.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYOptionView : UIView

//
@property (nonatomic,strong) NSArray *btnTitles;

@property (nonatomic,strong)void (^btnClick)(UIButton *btn);

//
-(void)setBtnTitles:(NSArray *)btntitles;

+(instancetype)OptionView;

@end
