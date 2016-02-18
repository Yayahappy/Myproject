//
//  QYquestion.m
//  猜图
//
//  Created by qingyun on 15/11/19.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYquestion.h"

@implementation QYquestion

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        _count = self.answer.length;
    }
    
    return self;
}

+(instancetype)questionWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}

@end
