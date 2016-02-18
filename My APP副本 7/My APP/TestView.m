//
//  TestView.m
//  My APP
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "TestView.h"
#import "NationViewController.h"
#import "MZViewController.h"
#import "moveScrollView.h"
#import "pageView.h"
#import "Models.h"

@interface TestView ()

@property (nonatomic,strong) NationViewController *nvCtr;
@property (nonatomic,strong) NSArray *array;

@end

@implementation TestView

-(NSArray *)array
{
    if (_array == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"picture" ofType:@"plist"];
        _array = [NSArray arrayWithContentsOfFile:path];
        
     }
    return _array;
}

-(id)initWithFrame:(CGRect)frame
              data:(id)data
         pageIndex:(NSInteger)index

{
    if (self = [self initWithFrame:frame]) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:frame];
        
        label.text = [NSString stringWithFormat:@"page--%ld--",(long)index];
         
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:30];
        [self addSubview:label];
        
        _nvCtr = [[NationViewController alloc] init];
        
        _array = [NSArray arrayWithArray:_nvCtr.array];
        
        Models *model = [_array objectAtIndex:index];
        
        //翻转图片大小
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:btn];
        
        btn.frame = CGRectMake(frame.origin.x+30, frame.origin.y+50, frame.size.width-60, frame.size.height-200);
        
        //设置圆角，边框宽度，边框颜色
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 150;
        btn.layer.borderWidth = 5;
        btn.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        btn.imageView.image = [UIImage imageNamed:model.picture];

        
        [btn setBackgroundImage:btn.imageView.image forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(gotoNext:) forControlEvents:UIControlEventTouchUpInside];
      
        
        btn.tag = index;
        
        _btn = btn;
        
        [self addSubview:_btn];
        
        }
    
    return self;
}

-(void)gotoNext:(UIButton *)btn
{
    for (int i = 0; i<_array.count; i++)
    {
       {
        if (btn.tag == i)
        {
            
            NSLog(@"%ld", (long)btn.tag);
        
            if (_btnclick)
            {
                _btnclick(btn);
            }
        }
        
       }
    }
}

@end
