//
//  FileHandle.m
//  租房
//
//  Created by qingyun on 15/12/26.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "FileHandle.h"

@implementation FileHandle

+(instancetype)shareHandel
{
    static FileHandle *handle;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        handle = [[FileHandle alloc] init];
    });
    NSLog(@"---%@---",handle);
    return handle;
}
//创建文件路径
-(NSString *)filePath:(NSString *)name
{
   //1.获取沙盒路径
    NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
  //2.创建文件路径 library / name
    NSString *filePath = [libraryPath stringByAppendingPathComponent:name];
  //3.判断文件是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        return filePath;
    }
  //4.创建文件
    if ([[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:0])
    {
        return filePath;
    }
    
    return nil;
}

//将租房列表存在本地文件
-(BOOL)saveLocalValue:(NSArray *)value saveName:(NSString *)name
{
   BOOL v = [value writeToFile:[self filePath:name] atomically:YES];
    return v;
}

//从本地获取租房列表
-(NSMutableArray *)loadFromLocal:(NSString *)name
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:[self filePath:name]];
    return array;
}

//将图片存在本地文件
-(BOOL)saveLocalImage:(UIImage *)image saveName:(NSString *)name
{
   //1.转化成NSData
    NSData *data = UIImageJPEGRepresentation(image, 1);
   //2.写在本地
    return [data writeToFile:[self filePath:name] atomically:YES];
}

//从本地获取图片
-(UIImage *)loadImageFormLocal:(NSString *)name
{
    return [UIImage imageWithContentsOfFile:[self filePath:name]];
}

@end
