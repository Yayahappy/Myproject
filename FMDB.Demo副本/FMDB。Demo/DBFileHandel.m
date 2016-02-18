//
//  DBFileHandel.m
//  FMDB。Demo
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "DBFileHandel.h"
#import "Header.h"

@interface DBFileHandel ()

@property (nonatomic,strong) FMDatabase *db;

@end

@implementation DBFileHandel

+(instancetype)shareHandel
{
    static DBFileHandel *Handel;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        
        Handel = [[DBFileHandel alloc] init];
        
        [Handel creatTable];
    });
 
    return Handel;
}

-(FMDatabase *)db
{
    if (_db) {
        return _db;
    }
    //1.创建db对象
    NSString *library = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSLocalDomainMask, YES)[0];
    NSString *filePath = [library stringByAppendingString:DBFILENAME];
    
    _db = [FMDatabase databaseWithPath:filePath];
    
    return _db;
}

//创建表
-(BOOL)creatTable
{
    //1.打开数据库
    if (![self.db open]) {
        return NO;
    }
    //2.执行sql语句
    if (![self.db executeUpdate:@"create table if not exists student()"])
    {
        NSLog(@"===执行失败%@=",[self.db lastErrorMessage]);
        
        [self.db close];
        
        return NO;
    };
    //3.关闭数据库
    [self.db close];
    
    return YES;
}

-(BOOL)deleteDataFromStu_id:(NSString *)stu_id
{
    //1. 打开数据库
    if (![self.db open])
    {
        NSLog(@"==删除打开失败%@==",[self.db lastErrorMessage]);
        return NO;
    }
    //2. 执行sql
    if (![self.db executeUpdate:@"delete from student where stu_id = ?",stu_id]) {
        NSLog(@"==删除失败%@==",[self.db lastErrorMessage]);
        
        [self.db close];
    };
    
    //3.
    [self.db close];
    
    return YES;
}

@end
