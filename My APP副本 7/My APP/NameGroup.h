//
//  Letter.h
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NameGroup : NSObject

@property (nonatomic,strong) NSArray *nation;
@property (nonatomic,strong) NSString *name;
@property (nonatomic) BOOL isopen;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

+(instancetype)nameGroupWithDictionary:(NSDictionary *)dict;

@end
