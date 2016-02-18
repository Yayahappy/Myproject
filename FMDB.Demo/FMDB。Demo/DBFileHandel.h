//
//  DBFileHandel.h
//  FMDB。Demo
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Students;
@interface DBFileHandel : NSObject

+(instancetype)shareHandel;

//删除一条数据
-(BOOL)deleteDataFromStu_id:(NSString *)name;
//删除所有数据
-(BOOL)deleteDataAll;
//插入数据
-(BOOL)insertDataFrom:(Students *)model;
//查询所有数据
-(NSMutableArray *)selectDataAll;
//查询指定数据
-(NSMutableArray *)selectDataFromWithName:(NSString *)stu_id;

@end
