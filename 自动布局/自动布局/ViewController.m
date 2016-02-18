//
//  ViewController.m
//  自动布局
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;

@end

@implementation ViewController

- (void)viewDidLoad
 {
    [super viewDidLoad];
 
     UIView *view2 = [[UIView alloc] init];
     UIView *view3 = [[UIView alloc] init];
     
     [view2 setBackgroundColor:[UIColor purpleColor]];
     [view3 setBackgroundColor:[UIColor yellowColor]];
     [self.view addSubview:view2];
     [self.view addSubview:view3];
     
     //将自适应布局约束的转化关掉
     [_view1 setTranslatesAutoresizingMaskIntoConstraints:NO];
     [view2 setTranslatesAutoresizingMaskIntoConstraints:NO];
     [view3 setTranslatesAutoresizingMaskIntoConstraints:NO];
     
     NSDictionary *views = NSDictionaryOfVariableBindings(self.view,_view1,view2,view3);
     
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_view1]-20-[view2(>=100)]-20-|" options:NSLayoutFormatAlignAllTop metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_view1]-20-[view3(>=200)]" options:0 metrics:nil views:views]];
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[view2]-20-[view3(>=200)]-20-|" options:0 metrics:nil views:views]];
     [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[view3(>=200)]-20-|" options:0 metrics:nil views:views]];
     
     
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
