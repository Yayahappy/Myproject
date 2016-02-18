//
//  HuseInfoCelll.h
//  租房
//
//  Created by qingyun on 15/12/27.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HouseInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *areaLable;

@property (weak, nonatomic) IBOutlet UILabel *quLable;
@property (weak, nonatomic) IBOutlet UILabel *typeLable;

@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@property (nonatomic,strong) NSDictionary *dic;

@end
