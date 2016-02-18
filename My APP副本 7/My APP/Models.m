//
//  Models.m
//  My APP
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "Models.h"

@implementation Models

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modelsWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
