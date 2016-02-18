//
//  ViewController.m
//  My APP
//
//  Created by qingyun on 15/12/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "NationViewController.h"
#import "TestView.h"
#import "pageView.h"
#import "MZViewController.h"
#import "ListViewController.h"
#import "moveScrollView.h"
#import "Models.h"
#import "FirstViewController.h"
#import "AppDelegate.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kCount 376

@interface NationViewController ()<UINavigationControllerDelegate,AVAudioPlayerDelegate>
{
    NSInteger index;
}

@property (nonatomic,strong) Models *model;

@property (nonatomic) CGRect  pageViewRect;
@property (nonatomic) CGRect  pageRect;

@property (nonatomic,strong) UIImageView *backgroundView1;
@property (nonatomic,strong) UIImageView *backgroundView2;

@property (nonatomic,strong) TestView *testV;

@property (nonatomic,strong) UIBarButtonItem *bar;

@property (nonatomic,strong) MZViewController *mzvc;

@property (nonatomic,strong) UIButton *btn;

@end

@implementation NationViewController

//懒加载
-(NSArray *)array
{
    if (_array == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"picture" ofType:@"plist"];
        
        NSArray *arrayPicture = [NSArray arrayWithContentsOfFile:path];
        
        //字典转模型
        NSMutableArray *models = [NSMutableArray array];
        
        for (NSDictionary *dict in arrayPicture) {
            
            Models *model = [Models modelsWithDictionary:dict];
            [models addObject: model];
            
        }
        _array = models;
    }
    return _array;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UIImage *image = [UIImage imageNamed:@"tab_community_normal@2x"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:image tag:1];
        self.tabBarItem = tabBarItem;
        }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"中国民俗大全";
   
    self.navigationController.delegate = self;
    CGFloat yPoint = 0.0f;
    CGRect rect = [UIScreen mainScreen].bounds;
    //设备管理器，一般 ????????
    if ([UIDevice currentDevice].systemVersion.floatValue > 6.0) {
        yPoint += 20.0f;
    }
    rect.size.height -= 20;
    //????
    yPoint += 30;
    //背景图片大小   ?????????
    CGRect pageViewRect = CGRectMake(0, yPoint, rect.size.width, rect.size.height);
    _pageViewRect = pageViewRect;
    //翻转图片大小  ?????????
    CGRect pageRect = CGRectMake(0, 0, rect.size.width, rect.size.height-20);
    _pageRect = pageRect;
    //添加背景图片
    UIImageView *backimage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kCount, kScreenH)];
    backimage1.image = [UIImage imageNamed:@"bgi.png"];
    _backgroundView1 = backimage1;
    [self.view addSubview:_backgroundView1];
    
    UIImageView *backimage2 = [[UIImageView alloc] initWithFrame:CGRectMake(kCount, 0, kCount, kScreenH)];
    backimage2.image = [UIImage imageNamed:@"bgi.png"];
    _backgroundView2 = backimage2;
    [self.view addSubview:_backgroundView2];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveImages) userInfo:nil repeats:YES];
    
    [self setpage];
    
    //rightbarbtnItem
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"民族" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick:)];
    
    rightBarBtnItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    _mzvc = [[MZViewController alloc]init];
    
    _array = [NSArray arrayWithArray:_mzvc.array];
    
//    //界面动画
//    FirstViewController *splashScreen = [[FirstViewController alloc] init];
//    
//    [self.view addSubview:splashScreen.view];
    
}

//加载歌曲
-(void)loadMusic:(NSString *)musicName AndType:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:musicName ofType:type];
    
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    _player.delegate = self;
}



-(void)setpage
{
    Models *model = self.array[index];
    _model =  model;

    //?????Capacity容量管理
    NSMutableArray *pages = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSInteger num = 0; num < _array.count; num ++) {
        
        TestView *page = [[TestView alloc] initWithFrame:_pageRect data:nil pageIndex:num ];
        
        //btn点击事件
        __weak NationViewController *weakself = self;
        page.btnclick = ^(UIButton *btn){
            [weakself testBtnClick:btn];
        };
        
        [pages addObject:page];
    }
    pageView *pView = [[pageView  alloc] initWithFrame:_pageViewRect andsubViews:pages anddefaultIndex:0 anddelegate:self andshowPageCotrol:YES];
    
    [self.view addSubview:pView];

}
//进入MZViewController
-(void)testBtnClick:(UIButton *)btn

{
    _mzvc = [[MZViewController alloc] init];
    _mzvc.indexpicture = btn.tag;
        
    //KVC取值
    [_mzvc setValue:@(btn.tag) forKey:@"indexpicture"];
    
    [self.navigationController pushViewController:_mzvc animated:YES];;
}

//进入listViewController
-(void)rightBtnClick:(UIBarButtonItem *)item
{
    ListViewController *livc = [[ListViewController alloc] init];
    
    //堆栈方式 弹出视图
    [self.navigationController pushViewController:livc animated:YES];
    
}

//移动背景图片
-(void)moveImages
{
    CGRect top = CGRectMake(kCount, 0, kCount+7, kScreenH);
    if (_backgroundView1.frame.origin.x <= -self.view.frame.size.width) {
        _backgroundView1.frame = top;
    } else if(_backgroundView2.frame.origin.x <= -self.view.frame.size.width) {
        _backgroundView2.frame = top;
    } else{
        CGFloat data = 3.76;
        CGRect frame3 = _backgroundView1.frame;
        CGRect frame4 = _backgroundView2.frame;
        frame3.origin.x -= data;
        frame4.origin.x -= data;
        [UIView animateWithDuration:0.1 animations:^{
            _backgroundView1.frame = frame3;
            _backgroundView2.frame = frame4;
        }];
    }
}

@end
