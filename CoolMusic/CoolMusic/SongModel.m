//
//  SongModel.m
//  CoolMusic
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SongModel.h"

@implementation SongModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {    //KVC赋值
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
