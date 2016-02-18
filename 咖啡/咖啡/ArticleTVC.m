//
//  ArticleTVC.m
//  咖啡
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ArticleTVC.h"
#import "ArticleModel.h"

@implementation ArticleTVC

-(void)setArticleModel:(ArticleModel *)articleModel
{
    self.titleLable.text = articleModel.title;
    self.currentLable.text = articleModel.summary;
    
    self.backImage.layer.masksToBounds = YES;
    self.backImage.layer.cornerRadius = 7;
}

@end
