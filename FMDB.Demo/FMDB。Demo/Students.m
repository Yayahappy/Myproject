//
//  Students.m
//  FMDB。Demo
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "Students.h"

@implementation Students

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.stu_id = value;
    }
}


-(instancetype)initWithDic:(NSDictionary *)value
{
    if (self = [super init])
    {
        //KVC赋值
        [self setValuesForKeysWithDictionary:value];
    }
    
    return self;
}

@end
