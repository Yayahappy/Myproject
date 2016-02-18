//
//  ViewController2.m
//  代理传值1
//
//  Created by qingyun on 15/11/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
#import "move.h"
@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextField *textfield2;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btn2:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        [self.delegate  change:_textfield2.text];
          
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
