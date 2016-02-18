//
//  RTableViewCell.m
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "NTableViewCell.h"
#import "Name.h"
@implementation NTableViewCell

-(void)setName:(Name *)name
{
    _name = name;
    self.textLabel.text = name.name;
    self.detailTextLabel.text = name.intro;
    self.imageView.image = [UIImage imageNamed:name.icon];
  

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
