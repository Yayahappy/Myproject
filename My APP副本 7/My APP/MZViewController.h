//
//  MZViewController.h
//  My APP
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class Models;

@interface MZViewController : UIViewController

//索引
@property (nonatomic)  NSInteger indexpicture;
@property (nonatomic,strong) Models *model;
@property (nonatomic,strong) NSArray *array;
@property (nonatomic,strong) UILabel *Headlable;
@property (nonatomic,strong) AVAudioPlayer *player;

@end
