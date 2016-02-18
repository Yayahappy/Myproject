//
//  Models.h
//  My APP
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Models : NSObject

@property (nonatomic,strong) NSString *picture;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *music;
@property (nonatomic,strong) NSString *musicName;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)modelsWithDictionary:(NSDictionary *)dict;

@end
