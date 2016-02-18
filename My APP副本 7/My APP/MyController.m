//
//  MyController.m
//  My APP
//
//  Created by qingyun on 15/12/4.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "MyController.h"

@interface MyController ()

@end

@implementation MyController

//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
//        self.tabBarItem = tabBarItem;
//    }
//    return self;
//}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.tabBarController.tabBar.tintColor = [UIColor brownColor];
    
    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
    
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
     self.view.backgroundColor = [UIColor yellowColor];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
