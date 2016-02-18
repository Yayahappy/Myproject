//
//  ViewController.m
//  代理传值1
//
//  Created by qingyun on 15/11/25.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ss"]) {
        
        ViewController2 *vc2 = segue.destinationViewController;
        
        vc2.delegate = self;
        
    }
}


-(void)change:(NSString *)value
{
    _textfield1.text = value;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
