//
//  DBFileHandel.m
//  FMDB。Demo
//
//  Created by qingyun on 15/12/29.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "DBFileHandel.h"
#import "Header.h"
#import "Students.h"

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
    NSString *library = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
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
    if (![self.db executeUpdate:@"create table if not exists student(stu_id text primary key,name text,age integer)"])
    {
        NSLog(@"===执行失败%@=",[self.db lastErrorMessage]);
        
        [self.db close];
        
        return NO;
    };
    //3.关闭数据库
    [self.db close];
    
    return YES;
}

//指定删除
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
//删除所有的数据
-(BOOL)deleteDataAll
{
    if (![self.db open]) {
        return NO;
    }
    if (![self.db executeUpdate:@"delete from student"]) {
        NSLog(@"==删除所有数据失败%@==",[self.db lastErrorMessage]);
        
        [self.db close];

    };
    
    [self.db close];
    
    return YES;
}

//添加
-(BOOL)insertDataFrom:(Students *)model
{
    //1. 打开数据库
    if (![self.db open]) return NO;
    
    //2. 执行sql语句
    if (![self.db executeUpdate:@"insert into student values(?,?,?)",model.stu_id,model.name,@(model.age)])
    {
        NSLog(@"==添加失败%@==",[self.db lastErrorMessage]);
        
        [self.db close];
        
        return NO;
    }
    [self.db close];
    
    return YES;
}

//查询指定数据
-(NSMutableArray *)selectDataFromWithName:(NSString *)stu_id
{
    if (![self.db open]) {
        
        NSLog(@"=搜索id打开失败=%@==",[self.db lastErrorMessage]);
        
        return nil;
    }
    
    FMResultSet *set = [self.db executeQuery:@"select *from student where stu_id %o%",stu_id];
    
    NSMutableArray *arr = [NSMutableArray array];
    
    while ([set next])
    {
        Students *model = [[Students alloc] initWithDic:[set resultDictionary]];
        [arr addObject:model];
    }
    
    [self.db close];
    
    return arr;
}

//查询所有数据
-(NSMutableArray *)selectDataAll
{
    if (![self.db open]) {
        
        NSLog(@"=搜索打开失败=%@==",[self.db lastErrorMessage]);
        
        return nil;
    }
    
    FMResultSet *set = [self.db executeQuery:@"select * from student"];
    
    NSMutableArray *arr = [NSMutableArray array];
    
    while ([set next])
    {
        Students *model = [[Students alloc]initWithDic:[set resultDictionary]];
        
        [arr addObject:model];
    }
   
    [self.db close];
    
    return arr;
}

@end
