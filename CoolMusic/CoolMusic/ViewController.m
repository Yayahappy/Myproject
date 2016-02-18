//
//  ViewController.m
//  CoolMusic
//
//  Created by qingyun on 15/12/31.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "SongListHandle.h"
#import "SongModel.h"
#import "SongLrcViewController.h"
#import "PlayerHandle.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"歌曲列表";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [SongListHandle sharaHandel].dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    SongModel *model = [SongListHandle sharaHandel].dataArr[indexPath.row];
    
    cell.textLabel.text = model.kName;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SongLrcViewController *songlrcVC = [[SongLrcViewController alloc] init];
    
    [PlayerHandle shareHandel].playIndex = indexPath.row;
    
    [self.navigationController pushViewController:songlrcVC animated:YES];
}

@end
