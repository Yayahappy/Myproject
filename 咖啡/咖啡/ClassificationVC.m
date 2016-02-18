//
//  ClassificationVC.m
//  咖啡
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ClassificationVC.h"

@interface ClassificationVC ()

@end

@implementation ClassificationVC

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UIImage *image = [UIImage imageNamed:@"tab_community_normal@2x"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"分类" image:image tag:1];
        self.tabBarItem = tabBarItem;
    }
    //设置图片数量
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.title = @"分类";
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
