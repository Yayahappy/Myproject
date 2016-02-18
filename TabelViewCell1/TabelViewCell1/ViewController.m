//
//  ViewController.m
//  TabelViewCell1
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *datas;

@end

@implementation ViewController

static NSString *identifier = @"yacell";

-(NSArray *)datas
{
    if (_datas == nil) {
        _datas = @[@"yaodayong",@"hanmengmeng",@"lizihao",@"wangyaya",@"niuchenjie",@"helili"];
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   //行高
    self.tableView.rowHeight = 100;
    
    //第二种重用单元格方式
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
}

#pragma mark - UITableViewDataSource


//每组行数 （必须实现）
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

//单元格 （必须实现）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
#if 0
    //从重用队列取闲置的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:indexPath.row % 4 reuseIdentifier:identifier];
    }
#else
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
#endif
    //设置imageView
    NSString *imageView = [NSString stringWithFormat:@"icon%ld.jpg",(long)indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:imageView];
    //设置textLabel
    cell.textLabel.text = self.datas[indexPath.row];
    //设置detailTextLabel
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@---%ld",self.datas[indexPath.row],indexPath.row];
        
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
