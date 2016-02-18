//
//  ViewController.m
//  图片浏览器
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *imageIndex;
@property (weak, nonatomic) IBOutlet UILabel *describe;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (nonatomic,strong) NSArray *array;

@property (nonatomic,assign) NSInteger index;
@end

@implementation ViewController

//懒加载 改写array的gitter方法

-(NSArray *)array
{
    if (_array == nil) {
      
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
        _array = [NSArray arrayWithContentsOfFile:path];
    
    }
    NSLog(@"%ld",_array.count);
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化界面 为第一张图片
    [self updateData];
    
}
- (IBAction)changeImage:(UIButton *)sender {
    
    if (sender.tag == 10) {
        
        _index --;
        
        [self updateData];
        
    }else if (sender.tag == 11)
    {
        _index ++;
        [self updateData];
    }
    
}

-(void)updateData
{
//    //1、更改imageView的图片
//    NSDictionary *dict = self.array[_index];
//    
//    NSString *imageName = [dict objectForKey:@"name"];
//    
//    UIImage *image = [UIImage imageNamed:imageName];
//    
//    _imageView.image = image;
//
//    //2、更改indexlabel的文本
//    NSString *indexdLabelText = [NSString stringWithFormat:@"%ld/%lu",_index + 1,(unsigned long)self.array.count];
//    
//    _imageIndex.text = indexdLabelText;
//    //3、更改当前图片的描述
//    
//    NSString *descLableText = dict[@"desc"];
//    
//    _describe.text = descLableText;
//
    
//    if (_index > self.array.count - 1) {
//        _index = 0;
//    }
    
    //更改imageView的图片
    //self.array   改写了array的gitter方法（懒加载），不能用_array
    
    NSDictionary *dict = [self.array objectAtIndex:_index];
    
    _imageView.image = [UIImage imageNamed:[dict objectForKey:@"name"]];
    
    //更改imageIndex的文本
    _imageIndex.text = [NSString stringWithFormat:@"%ld/%lu",_index+1,self.array.count];
    
    //更改当前图片的描述
    _describe.text = [dict objectForKey:@"desc"];
    
    
    //更改左右btn状态
#if 1
//    if (_index == 0) {
//        
//       _leftBtn.enabled = NO ;
//        
//    }else {
//        
//        _leftBtn.enabled = YES;
//        
//    }
//    
//    if (_index == self.array.count-1) {
//        
//        _rightBtn.enabled = NO;
//    }else{
//        
//        _rightBtn.enabled = YES;
//    }
}


#else 
//改变左右btn的状态
   _leftBtn.enabled = _index == 0 ? NO : YES;
   _rightBtn.enabled = _index == _array.count - 1 ? NO : YES;
#endif

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
