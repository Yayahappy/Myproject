//
//  Firend.h
//  LOL
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *intro;
@property (nonatomic)  BOOL vip;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

+(instancetype)friendWithDictionary:(NSDictionary *)dict;

@end
