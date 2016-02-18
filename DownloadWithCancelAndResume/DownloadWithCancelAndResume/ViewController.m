//
//  ViewController.m
//  DownloadWithCancelAndResume
//
//  Created by qingyun on 15/12/19.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

#define kImgURLStr @"http://cdn.tutsplus.com/mobile/uploads/2014/01/5a3f1-sample.jpg"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (weak, nonatomic) IBOutlet UIButton *CancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *ResumeBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (IBAction)download:(id)sender {
    
    
}

@end
