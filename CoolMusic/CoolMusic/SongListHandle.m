//
//  SongListHandle.m
//  CoolMusic
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SongListHandle.h"
#import "SongModel.h"

@implementation SongListHandle

+(instancetype)sharaHandel
{
    static dispatch_once_t once;
    static SongListHandle *Handel;
    
    dispatch_once(&once, ^{
        
        Handel = [SongListHandle new];
    });
    return Handel;
}

-(NSMutableArray *)dataArr
{
    if (_dataArr) {
        return _dataArr;
    }
    
    _dataArr = [NSMutableArray array];
    
    NSArray *arr = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SongsInfos" ofType:@"plist"]];
    
    for (NSDictionary *temp in arr)
    {    //字典转模型
        [_dataArr addObject:[[SongModel alloc] initWithDict:temp]];
    }
    return _dataArr;
}


@end
