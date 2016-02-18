//
//  FirendGroup.h
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic) NSInteger online;
@property (nonatomic,strong) NSArray *friends;
@property (nonatomic) BOOL isopen;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

+(instancetype)friendGroupWithDictionary:(NSDictionary *)dict;

@end
