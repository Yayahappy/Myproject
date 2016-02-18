//
//  ViewController.m
//  SampleDemo
//
//  Created by qingyun on 15/11/22.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UILabel *lable;
//@property (nonatomic,strong) UILabel *title;
//@property (weak, nonatomic) IBOutlet UIImageView *UIImage;
@property (nonatomic,strong) UISegmentedControl *seg;

@property (nonatomic,strong) UIImage *minimumValueImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UISlider
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 150, 250, 30)];
    [self.view addSubview:slider];
    
    //设置属性
    slider.minimumValue = 0;
    slider.maximumValue = 120;
    slider.value = 50 ;
    
    //添加颜色,图片
//    slider.minimumTrackTintColor = [UIColor yellowColor];
//    slider.maximumTrackTintColor = [UIColor greenColor];
    
//    slider.maximumValueImage = [UIImage imageNamed:@"drink"];
    //  UIImage *minimumValueImage = [UIImage imageNamed:@"drink"]; //????
    
    
    slider.thumbTintColor = [UIColor purpleColor];
//    [slider setThumbImage:[UIImage imageNamed:@"drink"] forState:UIControlStateNormal];
//    [slider setThumbImage:[UIImage imageNamed:@"drink"] forState:UIControlStateHighlighted];
    
    //拖动的时候，添加 addTarget , (onSlider:) 操作那个控件，那个控件来发件,
    [slider addTarget:self action:@selector(onSlider:) forControlEvents:UIControlEventValueChanged];//Slider控件 值改变
    
    //为slider添加text，显示当前数值
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 30)];
    
    [self.view addSubview:title];
    
//    slider.value是flout型，title.text是NSString型。slider.value需强转为NSString型  //两种方法强转：1，装箱 2，格式化字符串
//    
    title.text = [@(slider.value) stringValue];
    title.text = [NSString stringWithFormat:@"%.2f",slider.value];
    
    
    //UIView中有属性为title，故UILabel 不能把title用为
   //_lable.text = [@(slider.value) stringValue];
    _lable = title;
    
    
    //UISwitch
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(300, 100, 100, 30)];
    [self.view addSubview: sw];
    
    sw.on = NO;
    [sw addTarget:self action:@selector(onsw:) forControlEvents:UIControlEventValueChanged];
    sw.onTintColor = [UIColor yellowColor];
    sw.tintColor = [UIColor greenColor];
    
    
    //UISegmentedControl
#if 0
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithFrame:CGRectMake(85, 50, 200, 30)];
    [self.view addSubview:seg];
    
    [seg insertSegmentWithTitle:@"已接来电" atIndex:0 animated:NO];
    [seg insertSegmentWithTitle:@"未接来电" atIndex:1 animated:NO];
    
    _seg = seg;
#endif
    NSArray *arr = @[@"first",@"second",@"third"];
    _seg = [[UISegmentedControl alloc] initWithItems:arr];
    _seg.frame = CGRectMake(85, 50, 200, 30);
    [self.view addSubview:_seg];
    
    //挑选标号为1的按钮
    _seg.selectedSegmentIndex = 1;
    
    //按下按钮后不会一直处于当前状态
    _seg.momentary = YES;
    
    [_seg addTarget:self action:@selector(onSeg:) forControlEvents:UIControlEventValueChanged];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(200, 300, 40, 40);
    [self.view addSubview:btn];
    [btn setTitle:@"添加" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dynamicAddItem:) forControlEvents:UIControlEventTouchUpInside];
 
 
    //UIProgressView
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.frame = CGRectMake(100, 350, 200, 200);
    progressView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:progressView];
    
    //设置当前的值
    progressView.progress = 0.5;
    
    //已经走过的轨迹的颜色
   progressView.progressTintColor = [UIColor yellowColor];
    
    //未走过的轨迹的颜色
  // progressView.trackTintColor = [UIColor redColor];
    
    //已经走过的轨迹的图片(无效)
   // progressView.progressImage = [UIImage imageNamed:@"12"];
    
    //未走过的轨迹的图片(无效)
   // progressView.trackImage = [UIImage imageNamed:@"27"];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeProgress:) userInfo:progressView repeats:YES];
    
}

-(void)onSlider:(UISlider *)sender
{
    NSLog(@"%.2f",sender.value);
    _lable.text = [NSString stringWithFormat:@"%.2f",sender.value];
}

-(void)onsw:(UISwitch *)sender
{
    NSLog(@"%d",sender.on);
}

-(void)dynamicAddItem:(UIButton *)sender
{
    //插入新按钮
    [_seg insertSegmentWithTitle:@"全部电话" atIndex:2 animated:NO];
}

-(void)onSeg:(UISegmentedControl *)sender
{
    //输出当前选中的按钮
    NSLog(@"%@",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
}

-(void)changeProgress:(NSTimer *)timer
{
    UIProgressView *progressView = timer.userInfo;
    if (progressView.progress == 1) {
        progressView.progress = 0;
    }
    [progressView setProgress:(progressView.progress + 0.1) animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
