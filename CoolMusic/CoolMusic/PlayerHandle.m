//
//  PlayerHandle.m
//  CoolMusic
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "PlayerHandle.h"
#import <AVFoundation/AVFoundation.h>
#import "SongModel.h"
#import "SongListHandle.h"
#import "LrcParseModel.h"

@interface PlayerHandle ()<AVAudioPlayerDelegate>
//播放器
@property (nonatomic,strong)AVAudioPlayer *player;

//计时器
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation PlayerHandle

@synthesize currentTime = _currentTime;

+(instancetype)shareHandel
{
    static dispatch_once_t once;
    static PlayerHandle *handle;
    dispatch_once(&once, ^{
        
        handle = [PlayerHandle new];
        
        handle.playIndex = -1;
        
        //
        handle.volume = 0.3;
    });
    
    return handle;
}
//重写播放器
-(void)setPlayIndex:(NSInteger)playIndex
{
    if (playIndex!=-1)
    {
        if (_playIndex==playIndex) {
            return;
        }
          _playIndex = playIndex;
         //初始化播放器
        //1. 取模型
        SongModel *model = [SongListHandle sharaHandel].dataArr[playIndex];
       
        //解析歌词
        _lrcmodel = [[LrcParseModel alloc] initWithSongModel:model];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:model.kName withExtension:model.kType];
        
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        //设置音量
        _player.volume = self.volume;
        
        //播放器委托
        _player.delegate = self;
        
        //准备播放
        [_player prepareToPlay];
        
        //播放
        self.playorPause = YES;
        
        //更新歌词
        if (_delegate) {
            [self.delegate notifactionreSetUpDataLrc];
        }
    }else{
        _playIndex = playIndex;
    }
    
}

- (void)setPlayorPause:(BOOL)playorPause{
    if (playorPause) {
        [self.player play];
    }else{
        [self.player pause];
    }
    _playorPause = playorPause;
}
//当前播放状态
-(BOOL)isPlaying
{
    return self.player.isPlaying;
}

//下一曲
-(void)nextSong
{
    if (_playIndex<[SongListHandle sharaHandel].dataArr.count-1)
    {
        self.playIndex += 1;
    }else{
    
        self.playIndex = 0;
    }
}

//上一曲
-(void)prevSong
{
    if (_playIndex > 0) {
        self.playIndex -= 1;
    }else{
    
        self.playIndex = [SongListHandle sharaHandel].dataArr.count-1;
    }
}

//获取当前音量 (getter)
-(float)valume
{
    return self.player.volume;
}
//改变当前音量 (setter)
-(void)setVolume:(float)volume
{
    if (_volume == volume) {
        return;
    }
    self.player.volume = volume;
    _volume = volume;
}

//进度条
//改变当前的播放长度
-(void)setCurrentTime:(NSTimeInterval)currentTime
{
    if (_currentTime == currentTime) {
        return;
    }
    self.player.currentTime = currentTime;
    
    _currentTime = currentTime;
    
}
  //获取当前时间
-(NSTimeInterval)currentTime
{
    return self.player.currentTime;
}
 //获得总时长
-(NSTimeInterval)duration
{
    return self.player.duration;
}

-(NSTimer *)timer
{
    if (_timer) {
        return _timer;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(upDateTimer) userInfo:nil repeats:YES];
    
    return _timer;
}

-(void)upDateTimer
{
    //self.currentTime 回调当前播放时间
    if (_delegate) {
        [self.delegate updateProgressForTime:self.currentTime];
    
//    //当前选中
    NSInteger index = 0;
    NSTimeInterval time = self.currentTime;
    
    for (NSNumber *num in _lrcmodel.keyArr) {
        if (num.floatValue < time) {
            index += 1;
        }else{
            
            break;
            
        }
    }
        //回调歌词
        if (index!=0) {
            [self.delegate updateLrcselectIndex:index-1];
        }
    }
}

-(NSString *)songtitle
{
    SongModel *model = [SongListHandle sharaHandel].dataArr[_playIndex];
    return model.kName;
}

//重写delegate
-(void)setDelegate:(id<PlayerHandelPRo>)delegate
{
    if (delegate) {
        //启动计时器
        self.timer.fireDate = [NSDate distantPast];
    }else{
       //停止计时器
        self.timer.fireDate = [NSDate distantFuture];
    }

    _delegate = delegate;
}

#pragma mark - AVAudioPlayerDelegate
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (flag) {
        
        switch (self.playMode) {
            case sequenceLoop:
                //顺序播放
                [self nextSong];
                break;
            case singleLoop:
            {   //单曲循环
                NSInteger currentIndex = self.playIndex;
                self.playIndex = -1;
                self.playIndex = currentIndex;
            }
                break;
            case Random:
                //随机播放
                //生成一个随机数
                self.playIndex = arc4random()%[SongListHandle sharaHandel].dataArr.count;
                break;
            default:
                break;
        }
    }
}

@end
