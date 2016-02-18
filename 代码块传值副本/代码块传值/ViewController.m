//
//  ViewController.m
//  代码块传值
//
//  Created by qingyun on 15/11/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UILabel *lablestring;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}

//呈现模态视图
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
        if ([segue.identifier isEqualToString:@"vc"]) {
            
        //获取目标试图控制器
        ViewController2 *vc2 = segue.destinationViewController;
            
            
        [vc2 setValue:_username.text forKey:@"string"];
            

            void(^block) (NSString *)=^(NSString *str){
            
                _username.text = str;
            };
            
            vc2.block = block;
            
            
    }
    
    
    

    
}

//- (IBAction)btn1:(UIButton *)sender {
//    
//    [self dismissViewControllerAnimated:YES completion:^{
//        if (_black) {
//            _black(_username.text);
//        }
//    }];
//
//    UIStoryboard *stor = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    
//    ViewController2 *vc3 = [stor instantiateViewControllerWithIdentifier:@"uservc"];
//    
//    //
//    [vc3 setValue:_username.text forKey:@"string"];
//
// }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

 - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
