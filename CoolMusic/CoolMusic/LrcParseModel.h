//
//  LrcParseModel.h
//  CoolMusic
//
//  Created by qingyun on 16/1/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SongModel;

@interface LrcParseModel : NSObject

@property (nonatomic,strong) NSArray *keyArr;
@property (nonatomic,strong) NSMutableDictionary *lrcDic;

-(instancetype)initWithSongModel:(SongModel *)model;

@end
