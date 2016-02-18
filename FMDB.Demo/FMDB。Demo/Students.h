//
//  Students.h
//  FMDB。Demo
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Students : NSObject

@property (nonatomic) int age;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *stu_id;

-(instancetype)initWithDic:(NSDictionary *)dict;

//+(instancetype)initWithID:(NSString *)Id Name:(NSString *)name withAge:(int)age;

@end
