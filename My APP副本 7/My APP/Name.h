//
//  Name.h
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Name : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *intro;
@property (nonatomic,strong) NSString *music;
@property (nonatomic,strong) NSString *musicName;

-(instancetype)initWithnameDictionary:(NSDictionary *)dict;

+(instancetype)nameWithDictionary:(NSDictionary *)dict;

@end
