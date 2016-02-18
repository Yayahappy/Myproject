//
//  SectionHeaderView.m
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "SectionHeaderView.h"
#import "NameGroup.h"

@interface SectionHeaderView ()

@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UILabel *label;

@end

@implementation SectionHeaderView

static NSString *headerViewIdentifier = @"headerView";

+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView
{
    SectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headerView == nil) {
        headerView = [[SectionHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
    }
    
    return headerView;

}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //添加背景btn
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        
        //设置背景
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [btn setBackgroundImage:image forState:UIControlStateNormal];
        
        UIImage *highlightedimage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 0) resizingMode:UIImageResizingModeStretch];
        [btn setImage:highlightedimage forState:UIControlStateHighlighted];
        
        //设置图标
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        //设置标题字体颜色
        [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        
        //设置内容的显示 水平线  内容靠左
        //btn
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        //设置整体的偏移量
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //设置标题的偏移量
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //设置btn的图片视图的内容模式
        btn.imageView.contentMode = UIViewContentModeCenter;
        btn.imageView.clipsToBounds = NO;
        
        //添加事件监听
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btn = btn;
        
    }
    return self;
}

//布局子视图
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _btn.frame = self.bounds;
    
}

-(void)btnClick:(UIButton *)btn
{
    _nameGroup.isopen = ! _nameGroup.isopen;
    
    if (_headerViewClick) {
        _headerViewClick();
    }
    
}

-(void)setNameGroup:(NameGroup *)nameGroup
{
    _nameGroup = nameGroup;
    
    [_btn setTitle:nameGroup.name forState:UIControlStateNormal];
    
    if (_nameGroup.isopen) {
        _btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _btn.imageView.transform = CGAffineTransformIdentity;
    }
}

@end
