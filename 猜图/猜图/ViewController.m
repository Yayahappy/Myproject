//
//  ViewController.m
//  猜图
//
//  Created by qingyun on 15/11/19.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYquestion.h"

#import "QYAnswerView.h"
#import "QYOptionView.h"

@interface ViewController ()
{
    NSInteger index;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *numlable;
@property (weak, nonatomic) IBOutlet UILabel *dictlable;
@property (weak, nonatomic) IBOutlet UIButton *rembtn;
@property (weak, nonatomic) IBOutlet UIButton *bigimgbtn;
@property (weak, nonatomic) IBOutlet UIButton *helpbtn;
@property (weak, nonatomic) IBOutlet UIButton *nexbtn;

//所有题目的数据
@property (nonatomic,strong) NSArray *arr;

@property (nonatomic,strong) QYAnswerView *answerView;
@property (nonatomic,strong) QYOptionView *optionView;

@end

@implementation ViewController

-(NSArray *)arr
{
    if (_arr == nil) {
        
        //获取plist路径
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
       //用文件初始化数组
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //遍历数组，字典转模型
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYquestion *question = [QYquestion questionWithDictionary:dict];
            [models addObject:question];
        }
        _arr = models;
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self updateData];
}
- (IBAction)realize:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1://提示
            
         
            break;
        case 2://大图
            [self bigimage];
            break;
        case 3://help
            
            break;
        case 4://next
            
            index++;
            [self updateData];
            break;
        default:
            break;
    }
    
}

#pragma mark - 更新UI
//更新界面
-(void)updateData
{
    //循环展示题目
    if (index > self.arr.count - 1) {
        index = 0;
    }
    QYquestion *question = self.arr[index];
    
    //更改numLabel、titleLabel的文本以及imageView的图片
    _numlable.text = [NSString stringWithFormat:@"%ld/%lu",index+1,self.arr.count];
    
    _dictlable.text = question.title;
    _imageView.image = [UIImage imageNamed:question.icon];

    //再添加新的answerView时，先移除上一题中的_answerView，
    [_answerView removeFromSuperview];
    
    QYAnswerView *answerView = [QYAnswerView answerView:question.count];
    
    answerView.frame = CGRectMake(0, 350, 500, 400);
    
       [self.view addSubview:answerView];
    
     __weak ViewController *weakSelf = self;
    answerView.btnclick=^(UIButton *btn){
         [weakSelf answerBtnClick:btn];
    };
    _answerView = answerView;
    
    [_optionView removeFromSuperview];
    
    QYOptionView *optionView = [QYOptionView OptionView];
    optionView.frame = CGRectMake(10, 430, 0, 0);
    
    [self.view addSubview:optionView];
    
    //
    optionView.btnTitles = question.options;
    
    optionView.btnClick = ^(UIButton *btn){
        [weakSelf optionBtnClick:btn];
    };
    
    _optionView = optionView;
    
    
    
    NSLog(@"qwe");
}

#pragma mark -答案区域
-(void)answerBtnClick:(UIButton *)answerBtn
{
   //
    if (answerBtn.currentTitle == nil ) {
        return;
    }
    //
    UIButton *optionBtn = (UIButton *)[_optionView viewWithTag:answerBtn.tag];
    //
    optionBtn.hidden = NO;
    
    answerBtn.tag = optionBtn.tag = 0;
    
    //
    [answerBtn setTitle:nil forState:UIControlStateNormal];
    
    [self changeAnswerBtnTitleColor:[UIColor redColor]];

    //
    NSInteger answerBtnIndex = [_answerView.subviews indexOfObject:answerBtn];
    //
    [_answerView.answerBtnIndexs addObject:@(answerBtnIndex)];
    
    
    optionBtn.tag = answerBtn.tag = 100+ answerBtnIndex;
    //
     NSArray *array = [_answerView.answerBtnIndexs sortedArrayUsingSelector:@selector(compare:)];
    
    _answerView.answerBtnIndexs = [NSMutableArray arrayWithArray:array];
    
}
#pragma make -选择区域
-(void)optionBtnClick:(UIButton *)optionBtn
{
  
     NSLog(@"%ld",_answerView.answerBtnIndexs.count);
    if (_answerView.answerBtnIndexs.count>0 ) {
        //
        optionBtn.hidden = YES;
        
        
        //
        NSInteger answerBtnIndex = [[_answerView.answerBtnIndexs objectAtIndex:0] integerValue];
        //
        UIButton *answerBtn = _answerView.subviews[answerBtnIndex];
        //
        [answerBtn setTitle:optionBtn.currentTitle forState:UIControlStateNormal];
        //
        [_answerView.answerBtnIndexs removeObjectAtIndex:0];
        //
       
        
       // QYquestion *question = self.arr[index];

    }
    
}

-(void)changeAnswerBtnTitleColor:(UIColor *)color
{
    for (UIButton *btn in _answerView.subviews) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }

}
-(void)bigimage
{
    //铺满屏幕的btn
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
                     
    [self.view addSubview:btn];
                     
    btn.frame = self.view.frame;
    
    //将_imageView放在最上面,随着btn的变大而变大
    
   // [self.view bringSubviewToFront:btn];
    [self.view bringSubviewToFront:_imageView];
    [btn addTarget:self action:@selector(smallimage:) forControlEvents:UIControlEventTouchUpInside];
    
    btn.backgroundColor = [UIColor redColor];
    btn.alpha = 0;
   
    [UIView animateWithDuration:1.5 animations:^{
        _imageView.transform = CGAffineTransformScale(_imageView.transform, 1.5,1.5);
       btn.alpha = 0.5;
    }];
}

-(void)smallimage:(UIButton *)btn
{
    [UIView animateWithDuration:1 animations:^{
      //还原transform之前的状态
        _imageView.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished){
        //移除btn 每次点击 大图 时，都重新创建一个btn，然后再释放
        [btn removeFromSuperview];
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
