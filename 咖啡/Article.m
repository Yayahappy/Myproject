//
//  Article.m
//  咖啡
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Article.h"
#import "ArticleTVC.h"
#import "ArticleCurrentVC.h"
#import "URL.h"
#import "AFNetworking.h"
#import "ArticleModel.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface Article ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *articleTV;
@property (nonatomic,strong) UIImageView *backImage;
@property (nonatomic,strong) NSMutableArray *articleArr;

@end

@implementation Article

static NSString *identifier = @"cell";

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        UIImage *image = [UIImage imageNamed:@"tab_community_normal@2x"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"文章" image:image tag:1];
        self.tabBarItem = tabBarItem;
        
    }

    return self;
}

-(NSMutableArray *)articleArr
{
    if (_articleArr == nil) {
        _articleArr = [NSMutableArray array];
    }
    return _articleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg0"]];
    
    _backImage.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    
    [self.view addSubview:_backImage];
    
    self.navigationController.navigationBar.translucent = NO;

   
    _articleTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
    
    [self.view addSubview:_articleTV];
    
    self.navigationItem.title = @"文章";
    
    _articleTV.dataSource = self;
    _articleTV.delegate = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self.articleTV registerNib:[UINib nibWithNibName:@"ArticleTVC" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    
    _articleTV.rowHeight = 140;
    
    [self dataURLRequest];
}

-(void)dataURLRequest
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:ArticleUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // NSLog(@"%@",responseObject);
        NSDictionary *dict = responseObject[@"value"];
        
        NSArray *article = dict[@"articlelist"];
            
           // NSLog(@"<<%@>>",article);
            
            for (NSDictionary *articleDict in article) {
                
                ArticleModel *articleModel = [[ArticleModel alloc] initWithDictionary:articleDict];
                
                [self.articleArr addObject:articleModel];
                
                NSLog(@"%@",self.articleArr);
            }
        
        [self.articleTV reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleTVC *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ArticleTVC alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.articleModel = self.articleArr[indexPath.row];
    
    
    NSLog(@"%@",cell.articleModel);
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleCurrentVC *ACVC = [[ArticleCurrentVC alloc] init];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:ACVC animated:YES];
}

@end
