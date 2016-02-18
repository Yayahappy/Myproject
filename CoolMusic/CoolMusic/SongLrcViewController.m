//
//  SongLrcViewController.m
//  CoolMusic
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SongLrcViewController.h"
#import "PlayerHandle.h"
#import "NSString+timer.h"
#import "LrcParseModel.h"

@interface SongLrcViewController ()<UITableViewDelegate,UITableViewDataSource,PlayerHandelPRo>

@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property (weak, nonatomic) IBOutlet UIButton *playTypeBtn;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLab;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UISlider *voluemeSilder;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

@end

@implementation SongLrcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showView];
    
    [PlayerHandle shareHandel].delegate = self;
}
//视图
-(void)showView
{
    _voluemeSilder.minimumValue = 0;
    _voluemeSilder.maximumValue = 1;
    
    _voluemeSilder.value = [PlayerHandle shareHandel].volume;

    //初始化播放状态
    if ([PlayerHandle shareHandel].isPlaying)
    {    //暂停
        [_playBtn setTitle:@"暂停" forState:UIControlStateNormal];
    }else{
        //播放
        [_playBtn setTitle:@"播放" forState:UIControlStateNormal];
    }

    //初始化播放进度
    _progressSlider.maximumValue = [PlayerHandle shareHandel].duration;
    
    _progressSlider.value = [PlayerHandle shareHandel].currentTime;
    
    //4.初始化播放模式
    switch ([PlayerHandle shareHandel].playMode) {
        case singleLoop:
            [_playTypeBtn setTitle:@"单曲循环" forState:UIControlStateNormal];
            break;
        case Random:
            [_playTypeBtn setTitle:@"随机播放" forState:UIControlStateNormal];
            break;
        case sequenceLoop:
            [_playTypeBtn setTitle:@"顺序播放" forState:UIControlStateNormal];
            break;
        default:
            break;
    }

    //初始化标题
    self.title = [PlayerHandle shareHandel].songtitle;
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [PlayerHandle shareHandel].lrcmodel.keyArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.textLabel.text = [PlayerHandle shareHandel].lrcmodel.lrcDic[[PlayerHandle shareHandel].lrcmodel.keyArr[indexPath.row]];
    
     cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    return cell;
}

#pragma mark - 播放设置

- (IBAction)touchPrevSong:(UIButton *)sender
{
    [[PlayerHandle shareHandel] prevSong];
}
- (IBAction)touchNextSong:(UIButton *)sender
{
    [[PlayerHandle shareHandel] nextSong];
}
- (IBAction)touchPlayOrPause:(UIButton *)sender
{
    if ([PlayerHandle shareHandel].isPlaying)
    {    //暂停
        [PlayerHandle shareHandel].playorPause = NO;
        [sender setTitle:@"播放" forState:UIControlStateNormal];
    }else{
       //播放
        [PlayerHandle shareHandel].playorPause = YES;
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
    }
}
- (IBAction)volumChangeValue:(UISlider *)sender
{
    [PlayerHandle shareHandel].volume = sender.value;
}

- (IBAction)progressChangeValue:(UISlider *)sender
{
    [PlayerHandle shareHandel].currentTime = sender.value;
}
- (IBAction)PlayModeChang:(UIButton *)sender
{
    switch ([PlayerHandle shareHandel].playMode) {
        case sequenceLoop:
            [sender setTitle:@"单曲循环" forState:UIControlStateNormal];
            [PlayerHandle shareHandel].playMode  = singleLoop;
            break;
         case singleLoop:
            [sender setTitle:@"随机播放" forState:UIControlStateNormal];
            [PlayerHandle shareHandel].playMode = Random;
            break;
          case Random:
            [sender setTitle:@"顺序循环" forState:UIControlStateNormal];
            [PlayerHandle shareHandel].playMode = sequenceLoop;
            break;
        default:
            break;
    }
    
}

//实现代理方法
-(void)updateProgressForTime:(NSTimeInterval)time
{
   //更新进度条
    _progressSlider.value = time;
   //
    _currentTimeLab.text = [_currentTimeLab.text valueEXchange:time];
}

-(void)notifactionreSetUpDataLrc
{
   //刷新歌词
    self.title = [PlayerHandle shareHandel].songtitle;

    [_myTable reloadData];
}

-(void)updateLrcselectIndex:(NSInteger)index
{
   //选中歌词
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    [_myTable selectRowAtIndexPath:path animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    //滚动任意行
    [_myTable scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}
@end
