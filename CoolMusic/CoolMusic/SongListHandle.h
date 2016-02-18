//
//  SongListHandle.h
//  CoolMusic
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongListHandle : NSObject

//歌曲列表
@property (nonatomic,strong) NSMutableArray *dataArr;

+(instancetype)sharaHandel;

@end
