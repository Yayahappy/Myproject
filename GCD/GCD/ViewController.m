//
//  ViewController.m
//  GCD
//
//  Created by qingyun on 15/12/19.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)fetchData:(id)sender {
    
    NSDate *startDate = [NSDate date];
    
    __block NSString *string;
    __block NSString *result1;
    __block NSString *result2;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        //1. 模拟从网络请求数据
        string = [self fetchData];
        
        dispatch_group_t group = dispatch_group_create();
        
        //2. 模拟第一次对数据请求
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            result1 = [self firstHandling:string];
        });
        
        //3. 模拟第二次数据处理
      //  dispatch_group_async(group, dispatch_get_global_queue(dispatch, <#unsigned long flags#>), <#^(void)block#>)
        
        
    });
}

-(NSString *)fetchData
{
    [NSThread sleepForTimeInterval:3];
    NSString *str = @"We can do it ! Go fighting!";
    return str;
}

-(NSString *)firstHandling:(NSString *)string
{
    //将小写变成大写
    [NSThread sleepForTimeInterval:3];
    return [string uppercaseString];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
