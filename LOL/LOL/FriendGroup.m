//
//  FirendGroup.m
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"
@implementation FriendGroup

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //遍历friends，把字典转化成Ffriend
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            Friend *friend = [Friend friendWithDictionary:dic];
            
            [array addObject:friend];
        }
        self.friends = array;
    }
    return self;
}
 
+(instancetype)friendGroupWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
