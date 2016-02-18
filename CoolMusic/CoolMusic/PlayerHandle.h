//
//  PlayerHandle.h
//  CoolMusic
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LrcParseModel;

typedef enum : NSInteger
{
    sequenceLoop, //循环
      singleLoop, //单曲
          Random, //随机
}PlayModel;

//代理 协议
@protocol PlayerHandelPRo <NSObject>
//更新播放时间的UI
-(void)updateProgressForTime:(NSTimeInterval)time;
//重新刷新歌词
-(void)notifactionreSetUpDataLrc;
//选中歌词
-(void)updateLrcselectIndex:(NSInteger)index;

@end



@interface PlayerHandle : NSObject

+(instancetype)shareHandel;

@property (nonatomic,strong, readonly) LrcParseModel *lrcmodel;
//播放模式
@property (nonatomic,assign) PlayModel playMode;

//判断播放状态 （只读状态）
@property (nonatomic,readonly) BOOL isPlaying;
//设置播放按钮
@property (nonatomic) BOOL playorPause;
//当前播放歌曲下标
@property (nonatomic) NSInteger playIndex;
//音量
@property (nonatomic) float volume;
//当前播放时长
@property (nonatomic) NSTimeInterval currentTime;
//总时长
@property (nonatomic) NSTimeInterval duration;

//歌曲名称
@property (nonatomic,strong) NSString *songtitle;

//代理传值
@property (nonatomic,weak)id<PlayerHandelPRo>delegate;

-(void)nextSong;

-(void)prevSong;

@end
