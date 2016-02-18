//
//  ViewController.m
//  Calculator
//
//  Created by qingyun on 15/11/10.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *leftText;
@property (weak, nonatomic) IBOutlet UITextField *rightNum;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(UIButton *)sender {
    
    
    int leftNum = [_leftText.text intValue];
    int rightNum = [_rightNum.text intValue];
    int result = leftNum + rightNum;
    
    _result.text = [@(result) stringValue];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
#if 1
    [_leftText resignFirstResponder];
    [_rightNum resignFirstResponder];
#else
    [self.view endEditing:YES];
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
