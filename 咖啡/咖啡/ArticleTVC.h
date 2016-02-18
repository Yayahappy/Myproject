//
//  ArticleTVC.h
//  咖啡
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ArticleModel;

@interface ArticleTVC : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *currentLable;

@property (nonatomic,strong) ArticleModel *articleModel;

@end
