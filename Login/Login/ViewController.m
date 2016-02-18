//
//  ViewController.m
//  Login
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//
- (IBAction)login:(UIButton *)sender {
    
    //
    if ([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名和密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
        
        [alertController addAction:action];
        
      //  [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    //
    if ([_username.text isEqualToString:@"09"] && [_password.text isEqualToString:@"po"]) {
        
        //
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //
        ViewController1 *uservc = [storyboard instantiateViewControllerWithIdentifier:@"uservc"];
        
        //??????????????????????????????
        //kvc方式传值
        [uservc setValue:_username forKey:@"labelString"];
        
    }
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
