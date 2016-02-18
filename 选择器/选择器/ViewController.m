//
//  ViewController.m
//  选择器
//
//  Created by qingyun on 15/12/7.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置范围
    //设置最小时间
    //创建时间的组成部分
    NSDateComponents *components = [[NSDateComponents alloc] init];
    //设置日期
    components.year = 2015;
    components.month = 11;
    components.day = 20;
    
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *mindate = [calendar dateFromComponents:components];
    
    _datePicker.minimumDate = mindate;
    
    //设置最大的时间
    NSDate *maxDate = [[NSDate alloc]initWithTimeIntervalSinceNow:2*24*60*60];
    _datePicker.maximumDate = maxDate;
    
    //把世界时间转化成当前时区的时间
   // NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    
    NSString *dateString = [_datePicker.date descriptionWithLocale:_datePicker.locale];
    
    //添加事件监听
    [_datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
}

-(void)datePickerValueChange:(UIDatePicker *)datePicker
{
    NSLog(@"%@",[datePicker.date descriptionWithLocale:datePicker.locale]);
}
- (IBAction)selected:(UIButton *)sender {
    //当前 时间
    NSString *selectedDate = [_datePicker.date descriptionWithLocale:_datePicker.locale];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"我选择的时间：" message:selectedDate preferredStyle:UIAlertControllerStyleAlert];
    //添加action
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
    }];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
