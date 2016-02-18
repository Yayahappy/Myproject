//
//  ViewController2.m
//  代码块传值
//
//  Created by qingyun on 15/11/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController2.h"
//#import "ViewController.h"
@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UILabel *lable;


@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *user;

@property (nonatomic,strong) NSString *string;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _user.text = [NSString stringWithFormat:@"%@",_string];
}





-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"vc2"]) {
        
        ViewController *vc1 = segue.destinationViewController;
        void(^black) (NSString *)=^(NSString *str1){
            
            _user.text = str1;
        };
        
        vc1.black = black;
        
    }
    
    
    
}

- (IBAction)back:(UIButton *)sender {
    
    //关闭模态视图
    [self dismissViewControllerAnimated:YES completion:^{
        if (_block) {
            _block(_user.text);
        }
    }];
    

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
