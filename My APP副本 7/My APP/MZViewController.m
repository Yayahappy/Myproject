//
//  MZViewController.m
//  My APP
//
//  Created by qingyun on 15/12/5.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "MZViewController.h"
#import "moveScrollView.h"
#import "ListViewController.h"
#import "Models.h"
#import "BigScrollerView.h"
#import "SmallScrollerView.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

#define kCountH 30
#define kCountW 30
#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

@interface MZViewController ()<UIScrollViewDelegate,AVAudioPlayerDelegate,UITableViewDataSource,UITableViewDelegate>
{    //导航栏View
    UIView *navView;
    //与 topV 相对应的 ScrollView
    UIScrollView *scrollerV;
    //导航栏下方背景
    UIView *topV;
    //第一个ScrollView下划线
    UIView *navBgv;
    
    CGFloat startPointX;
    
}

@property (nonatomic, strong) SmallScrollerView *itemsView;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *middleTableView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, strong) BigScrollerView *tablesScrollView;
@property (nonatomic) NSInteger currentIndex;

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSArray *itemsArr;
@property (nonatomic, strong) NSArray *leftArr;
@property (nonatomic, strong) NSArray *middleArr;
@property (nonatomic, strong) NSArray *rightArr;


@property (nonatomic,strong) UIButton *btnback;
//topV上的ScrollView
@property (nonatomic,strong) UIScrollView *topScrollV;

@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UIButton *musicBtn;

@end

@implementation MZViewController

//懒加载
-(NSArray *)array
{
    if (_array == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"picture" ofType:@"plist"];
        
        NSArray *arraypicture = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *models = [NSMutableArray array];
        
        //字典转模型
        for (NSDictionary *dict in arraypicture) {
            
            Models *model = [Models modelsWithDictionary:dict];
            
            [models addObject:model];
        }
        _array = models;
    }
    return _array;
}


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _itemsArr = @[@"节日",@"民俗",@"历史",@"宗教",@"服饰"];
    [self createItemsScrollView];
    [self createScrollViewAndTableViews];
    [self changeTableViewAndLoadData];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"上一页" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0,70, 40);
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    
    //自定义导航栏
    navView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    navView.backgroundColor = [UIColor clearColor];
    ((UIImageView *)navView).backgroundColor = RGBA(230, 230, 230, 1);
    [self.view addSubview:navView];
    
    navView.userInteractionEnabled = YES;
    
    //头标题
    _Headlable = [[UILabel  alloc] initWithFrame:CGRectMake(kScreenWidth/2-30, 30, 100,kCountH)];
    
    [_Headlable setTextColor:[UIColor purpleColor]];
    
    _Headlable.font = [UIFont systemFontOfSize:24];
    
    Models *model = self.array[_indexpicture];
    
    _model = model;
    
    _Headlable.text = _model.name;

    
    [navView addSubview:_Headlable];
    
//    topV = [[UIView alloc] initWithFrame:CGRectMake(0, navView.frame.size.height+navView.frame.origin.y, kScreenWidth, kCountH)];
//    
//    [self.view addSubview:topV];
//    
//    topV.backgroundColor = RGBA(230, 230, 230, 1);
//    
//    scrollerV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topV.frame.origin.y+kCountH, kScreenWidth, kScreenHeight-topV.frame.origin.y+kCountH)];
//    [scrollerV setPagingEnabled:YES];
//    [scrollerV setShowsHorizontalScrollIndicator:YES];
//    [self.view insertSubview:scrollerV aboveSubview:navView];
//  
//    scrollerV.delegate = self;
    
 //   [self skipNext];
    
    //音乐Btn
    UIButton *musicBtn = [[UIButton alloc] initWithFrame:CGRectMake(320, 600,40, 40)];
    [musicBtn setImage:[UIImage imageNamed:@"music1"] forState:UIControlStateNormal];

    [musicBtn addTarget:self action:@selector(musicStart) forControlEvents:UIControlEventTouchUpInside];
    
    _musicBtn = musicBtn;
    
    [self.view addSubview:_musicBtn];
    
    [self loadMusic:model.musicName AndType:@"mp3"];
    //播放歌曲
    [_player play];
    
}



//加载歌曲
-(void)loadMusic:(NSString *)musicName AndType:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:musicName ofType:type];
    
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    _player.delegate = self;
}

//播放
-(void)musicStart
{
    if (_player.playing) {
        [_player pause];
        
        [_musicBtn setImage:[UIImage imageNamed:@"music2"] forState:UIControlStateNormal];
    }else{
        [_player play];
        
        [_musicBtn setImage:[UIImage imageNamed:@"music1"] forState:UIControlStateNormal];
    }
}

- (void)createItemsScrollView
{
    _itemsView = [[SmallScrollerView alloc] initWithButtonArr:_itemsArr];
    
    _itemsView.frame = CGRectMake(0, navView.frame.size.height+navView.frame.origin.y, kScreenWidth, 30);
    //控制器通过block块来获取index值的变化
    __weak MZViewController *weakSelf = self;
    void (^changeValue)(NSInteger) = ^(NSInteger currentIndex){
        _currentIndex = currentIndex;
        [weakSelf changeTableViewAndLoadData];
    };
    [_itemsView setValue:changeValue forKey:@"changeIndexValue"];
    
    [self.view insertSubview:_itemsView aboveSubview:navView];
}

- (void)changeTableViewAndLoadData
{
    //index = 0 情况，只需要刷新左边tableView和中间tableView
    if (_currentIndex == 0) {
        
        _leftArr = self.dataArr[_currentIndex];
        _middleArr = self.dataArr[_currentIndex +1];
        
        [_leftTableView reloadData];
        [_middleTableView reloadData];
        
        self.tablesScrollView.contentOffset = CGPointMake(0, 0);
        
        //index 是为最后的下标时，刷新右边tableView 和 中间 tableView
    }else if(_currentIndex == _itemsArr.count - 1){
        _rightArr = self.dataArr[_currentIndex];
        _middleArr = self.dataArr[_currentIndex - 1];
        [_rightTableView reloadData];
        [_middleTableView reloadData];
        
        self.tablesScrollView.contentOffset = CGPointMake(kScreenWidth*2, 0);
        //除了上边两种情况，三个tableView 都要刷新，为了左右移动时都能够显示数据
    }else{
        _rightArr = self.dataArr[_currentIndex+1];
        _middleArr = self.dataArr[_currentIndex];
        _leftArr = self.dataArr[_currentIndex - 1];
        
        [_rightTableView reloadData];
        [_middleTableView reloadData];
        [_leftTableView reloadData];
        
        self.tablesScrollView.contentOffset = CGPointMake(kScreenWidth, 0);
    }
}

//在ScrollView中创建三个tableView
- (void)createScrollViewAndTableViews
{
    _tablesScrollView = [[BigScrollerView alloc] initBigScrollView];
    _tablesScrollView.delegate = self;
    [self.view addSubview:_tablesScrollView];
    
    CGRect frame = _tablesScrollView.frame;
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight-30) style:UITableViewStylePlain];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    [_tablesScrollView addSubview:_leftTableView];
    
    frame.origin.x = kScreenWidth;
    _middleTableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth,kScreenHeight-30) style:UITableViewStylePlain];
    _middleTableView.delegate = self;
    _middleTableView.dataSource = self;
    [_tablesScrollView addSubview:_middleTableView];
    
    frame.origin.x = 2*kScreenWidth;
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth*2, 0, kScreenWidth,kScreenHeight-30) style:UITableViewStylePlain];
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
    [_tablesScrollView addSubview:_rightTableView];
    
    //注意这里的contentOffset初始化为(0,0)
    _tablesScrollView.contentOffset = CGPointMake(0, 0);
    
    
}

#pragma mark - UIScrollerViewDelegate
//SrollView 的代理方法，停止滑动时，确定index 并且调用刷新 tableView 的方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if ([scrollView isEqual: _tablesScrollView]) {
        
        CGPoint point = _tablesScrollView.contentOffset;
        //当ScrollView的contentOffSet的偏移量从 kScreenWidth 到 2*kScreenWidth 的情况
        if(point.x > _tablesScrollView.frame.size.width){
            
            _currentIndex +=1;
            if (_currentIndex > _itemsArr.count - 1) {
                _currentIndex = _itemsArr.count - 1;
            }
            [self changeTableViewAndLoadData];
            //当ScrollView的contentOffSet 的偏移量从 kScreenWidth 到 0 时的情况
        }else if(point.x == 0){
            
            _currentIndex -=1;
            if (_currentIndex < 0) {
                _currentIndex = 0;
            }
            [self changeTableViewAndLoadData];
        }
        //当下标为0，并且当ScrollView的contentOffSet 的偏移量从 0 到 kScreenWidth 的情况
        if (point.x == kScreenWidth && _currentIndex == 0){
            _currentIndex ++;
            [self changeTableViewAndLoadData];
        }
        
        //当下标为最后一个时，并且ScrollView 的ContentOffSet 的偏移量 从 2*kScreenWidth 到 kScreenWidth 的情况
        if (point.x == kScreenWidth && _currentIndex == _itemsArr.count-1) {
            _currentIndex --;
            [self changeTableViewAndLoadData];
        }
        
    }
    _itemsView.index = _currentIndex;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_leftTableView]) {
        return  _leftArr.count;
    }else if([tableView isEqual:_middleTableView]){
        return _middleArr.count;
    }
    return _rightArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (tableView == _leftTableView) {
        cell.textLabel.text = _leftArr[indexPath.row];
    }else if(tableView == _middleTableView){
        cell.textLabel.text = _middleArr[indexPath.row];
    }else{
        cell.textLabel.text = _rightArr[indexPath.row];
    }
    return cell;
}

//连续播放音乐
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (flag) {
        [_player play];
    }
}


//返回首页
-(void)back:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [_player stop];
}


@end
