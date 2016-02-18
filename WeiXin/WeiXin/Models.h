//
//  Models.h
//  WeiXin
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Models : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *buycount;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *price;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
