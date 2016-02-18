//
//  HuseInfoCelll.m
//  租房
//
//  Created by qingyun on 15/12/27.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "HouseInfoCell.h"

@implementation HouseInfoCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setDic:(NSDictionary *)dic
{
    self.areaLable.text = dic[@"community"];

    self.quLable.text = dic[@"simpleadd"];
    
    self.typeLable.text = dic[@"housetype"];
    
    NSInteger price = [dic[@"price"] integerValue];
    
    self.priceLable.text = [NSString stringWithFormat:@"%ld元",price];
    
    _dic = dic;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
