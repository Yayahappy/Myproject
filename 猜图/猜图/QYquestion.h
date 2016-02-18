//
//  QYquestion.h
//  猜图
//
//  Created by qingyun on 15/11/19.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYquestion : UIView

@property (nonatomic,strong) NSString *answer;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSArray *options;

@property (nonatomic) NSInteger count;

//两种声明方法
//对象方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;

//类方法
+(instancetype)questionWithDictionary:(NSDictionary *)dict;

@end
