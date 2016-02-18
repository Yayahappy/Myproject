//
//  ViewController.h
//  My APP
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface NationViewController : UIViewController

@property (nonatomic,strong) void (^block)(NSInteger);

@property (nonatomic,strong) AVAudioPlayer *player;

@property (nonatomic,strong) NSArray *array;

@end

