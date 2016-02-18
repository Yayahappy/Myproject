//
//  Models.m
//  WeiXin
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "Models.h"

@implementation Models
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
