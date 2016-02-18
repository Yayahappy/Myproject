//
//  Letter.m
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "NameGroup.h"
#import "Name.h"

@implementation NameGroup

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //遍历nation，把字典转化成Name name
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.nation) {
            Name *name = [Name nameWithDictionary:dic];
            
            [array addObject:name];
        }
        self.nation = array;
    }
         return self;
}

+(instancetype)nameGroupWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
