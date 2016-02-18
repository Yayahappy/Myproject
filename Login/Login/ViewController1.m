//
//  ViewController1.m
//  Login
//
//  Created by qingyun on 15/11/24.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (nonatomic,strong) NSString *lablestring;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    _lable.text = [NSString stringWithFormat:@"Hello,%@",_lablestring];
    
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
