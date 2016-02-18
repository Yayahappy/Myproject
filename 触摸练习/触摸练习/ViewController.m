//
//  ViewController.m
//  触摸练习
//
//  Created by qingyun on 15/12/11.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *CyanSquare;
@property (weak, nonatomic) IBOutlet UIImageView *MagentaSquare;
@property (weak, nonatomic) IBOutlet UIImageView *YellowSquare;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (CGRectContainsPoint(<#CGRect rect#>, <#CGPoint point#>)) {
        <#statements#>
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
