//
//  ViewController.m
//  应用管理器
//
//  Created by qingyun on 15/11/17.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

#define KScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic,strong) NSArray *arr;

@end

@implementation ViewController

-(NSArray *)arr
{
    if (_arr == nil) {
        
        //通过路径将字典赋给字符串
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        
        //将字符串赋给数组
        _arr  = [NSArray arrayWithContentsOfFile:path];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //列数
    int toloColumn = 3;
    
    //appview 的宽高
    
  //  UIImage *appview = [[UIImage alloc] init];
    
    CGFloat appW = 80;
    CGFloat appH = 90;
    
    //间隔
    
    CGFloat marginX = (KScreenW - toloColumn*appW) / (toloColumn+1);
    CGFloat marginY = 40;
    
    for (int i = 0; i<self.arr.count; i++) {
        // 01 创建appView的视图，并将视图添加到self.view上
        int row = i/toloColumn ;//行取商
        int column = i%toloColumn ;//列取余
        
        //每个appView的坐标
        CGFloat appX = marginX + column*(marginX+appW);
        CGFloat appY = marginY + row * (marginY+appH);
        
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(appX, appY, appW, appH)];
      //  [appView setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:appView];
        
        // 02 .创建icon视图，并添加到appView上
        CGFloat iconX = 15;
        CGFloat iconY = 0;
        CGFloat iconW = appW-2*iconX;
        CGFloat iconH = 50;
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(iconX, iconY, iconW, iconH)];
        [appView addSubview:icon];
        NSDictionary *appData = self.arr[i];
        icon.image = [UIImage imageNamed:appData[@"icon" ]];
        
        // 03 .创建title，并添加到appView上
        CGFloat titleX = 0;
        CGFloat titleY = iconH;
        CGFloat titleW = appW;
        CGFloat titleH = 20;
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
        [appView addSubview:title];
        
        title.text = appData[@"name"];
        title.font = [UIFont systemFontOfSize:12];
        title.textAlignment = NSTextAlignmentCenter;
        
        // 04 .创建下载按钮，并添加到appView上
        CGFloat btnX = 0;
        CGFloat btnY = iconH+titleH;
        CGFloat btnW = appW;
        CGFloat btnH = 20;
        
 // UIButtonTypeCustom和[[UIButton alloc] init]是等价的
        
     // UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
    //  btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        [appView addSubview:btn];
        
        [btn setTitle:@"下载" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen"]  forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"]  forState:UIControlStateNormal];

       // [btn setImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];

        
        

        
        
    }
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
