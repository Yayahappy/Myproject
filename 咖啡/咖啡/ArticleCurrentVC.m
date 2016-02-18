//
//  ArticleCurrentVC.m
//  咖啡09
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ArticleCurrentVC.h"
#import "Article.h"

@interface ArticleCurrentVC ()

@property (nonatomic,strong) Article *AVC;

@end

@implementation ArticleCurrentVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backArticle)];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
   }

-(void)backArticle
{
    _AVC = [[Article alloc] init];
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}


@end
