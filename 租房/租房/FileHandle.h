//
//  FileHandle.h
//  租房
//
//  Created by qingyun on 15/12/26.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FileHandle : NSObject
/*
   存储租房列表
   value 存的数组
   name 文件名称
 */
-(BOOL)saveLocalValue:(NSArray *)value saveName:(NSString *)name;
/*
    读取租房列表
    name 文件名称
 */
-(NSMutableArray *)loadFromLocal:(NSString *)name;

/*
    存储图片
    image 存储的image对象
    name 图书名称
 */
-(BOOL)saveLocalImage:(UIImage *)image saveName:(NSString *)name;

/*
   读取本地图片
   name 图片名称
 */
-(UIImage *)loadImageFormLocal:(NSString *)name;

+(instancetype)shareHandel;

@end
