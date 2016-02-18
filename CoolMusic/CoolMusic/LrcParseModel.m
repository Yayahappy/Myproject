//
//  LrcParseModel.m
//  CoolMusic
//
//  Created by qingyun on 16/1/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LrcParseModel.h"
#import "SongModel.h"

@implementation LrcParseModel

-(void)lrcParseFromArr:(NSArray *)arr
{
    for (NSString *lrcStr in arr) {
        //以 [:] 将歌词拆分 存入数组
        NSArray *lrcArr = [lrcStr componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[:]"]];
        
        if (lrcArr.count >= 4)
        {
            NSString *minuse = lrcArr[1];
            if ([minuse hasPrefix:@"0"])
            {
                NSString *second = lrcArr[2];
                NSString *lrc = lrcArr[3];
    
                float key = minuse.intValue*60 + second.floatValue;
                //将时间和歌词存入字典  以时间作为键
                [self.lrcDic setObject:lrc forKey:@(key)];
            }
        }
    }
    //排序
    self.keyArr=[[self.lrcDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
}

-(instancetype)initWithSongModel:(SongModel *)model
{
    if (self = [super init]) {
       //解析歌词
         //取出歌词
        NSString *lrcStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:model.kName ofType:@"lrc"] encoding:NSUTF8StringEncoding error:nil];
         //歌词以\n拆分
        NSArray *arr = [lrcStr componentsSeparatedByString:@"\n"];
        
        //初始化字典
        self.lrcDic = [NSMutableDictionary dictionary];
        
        [self lrcParseFromArr:arr];
    }
    return self;
}

@end
