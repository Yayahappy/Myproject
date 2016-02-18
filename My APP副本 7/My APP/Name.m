//
//  Name.m
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "Name.h"

@implementation Name

-(instancetype)initWithnameDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;

}

+(instancetype)nameWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithnameDictionary:dict];
}

@end
