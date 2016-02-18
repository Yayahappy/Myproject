//
//  TableViewCell.m
//  WeiXin
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "TableViewCell.h"
#import "Models.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end

@implementation TableViewCell

-(void)setDatas:(Models *)datas
{
    _datas= datas;
    _label1.text = datas.title;
    _label2.text = datas.price;
    _label3.text = datas.buycount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
