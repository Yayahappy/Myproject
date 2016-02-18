//
//  SmallScrollerView.m
//  My APP
//
//  Created by qingyun on 15/12/24.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "SmallScrollerView.h"

#define kButtonWidth  [UIScreen mainScreen].bounds.size.width/5
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

@interface SmallScrollerView()

@property (nonatomic, strong) NSArray *buttonsArr;
@property (nonatomic, strong) UIView *slidView;

@end

@implementation SmallScrollerView

-(instancetype)initWithButtonArr:(NSArray *)arr
{
    if (self = [super init]) {
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        self.frame = CGRectMake(0, 0, kScreenWidth, 30);
        self.contentSize = CGSizeMake(arr.count*kButtonWidth, 50);
        
        self.backgroundColor = RGBA(230, 230, 230, 1);
        self.selectedColor = [UIColor redColor];
        
        [self createSlidView];
        
        //创建ScrollerView上的所有的Button
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (int i = 0;  i < arr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(kButtonWidth*i, 60, kButtonWidth, 30);
            
            [self addSubview:btn];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            
            UIColor *color = RGBA(100, 100, 200, 1);
            [btn setTitleColor:color forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
            btn.tag = 100+1;
            
            [btn addTarget:self action:@selector(btnIsClicked:) forControlEvents:UIControlEventTouchUpInside];
            [mutableArr addObject:btn];
            
        }
        self.buttonsArr = mutableArr;
        
        self.index = 0;
    }
    
    return self;
}

-(void)createSlidView
{
    _slidView = [[UIView alloc] initWithFrame:CGRectMake(0, 75, kButtonWidth, 2)];
    _slidView.backgroundColor = RGBA(100, 200, 200, 1);
    
    [self addSubview:_slidView];
}
-(void)btnIsClicked:(UIButton *)btn
{
    self.index = btn.tag - 100;
    //block的回调，当Item的index发生变化时，将index的传感控制器
    if (_changeIndexValue) {
        _changeIndexValue(_index);
    }
}

-(void)setIndex:(NSInteger)index
{
    //给未选中Btn设置状态
    UIButton *notSelectedBtn = _buttonsArr[_index];
    notSelectedBtn.selected = NO;
    
    //给选中Btn设置状态
    UIButton *SelectedBtn = _buttonsArr[index];
    SelectedBtn.selected = YES;
    
    //
    CGFloat offSetX = SelectedBtn.frame.origin.x - kButtonWidth/2;
    offSetX = offSetX > 0 ? (offSetX + kButtonWidth/2):0;
    offSetX = offSetX > self.contentSize.width - kScreenWidth ?
       self.contentSize.width - kScreenWidth : offSetX;
    [UIView animateWithDuration:0.3 animations:^{
        self.contentOffset = CGPointMake(offSetX, 0);
    }];
    
    _index = index;
    CGRect frame = _slidView.frame;
    frame.origin.x = _index*kButtonWidth;
    [UIView animateWithDuration:0.3 animations:^{
    
        _slidView.frame = frame;
    }];
    
}
@end
