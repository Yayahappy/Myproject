//
//  ViewController.m
//  自动布局homeWork
//
//  Created by qingyun on 16/1/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic,strong) UIView      *Myview;
@property (nonatomic,strong) UIImageView *avatarImageView;
@property (nonatomic,strong) UILabel     *nicknameLable;
@property (nonatomic,strong) UIView      *timestampIndicator;
@property (nonatomic,strong) UILabel     *timestampLable;
@property (nonatomic,strong) UIImageView *contentImageView;
@property (nonatomic,strong) UIView      *likeIndicator;
@property (nonatomic,strong) UILabel     *likesLabel;
@property (nonatomic,strong) UIButton    *likeButton;
@property (nonatomic,strong) UIButton    *commentButton;
@property (nonatomic,strong) UIButton    *moireButton;

@end

@implementation ViewController

-(UIImageView *)avatarImageView{
    if (_avatarImageView == nil) {
        _avatarImageView = [UIImageView new];
        _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return _avatarImageView;
}


-(UILabel *)nicknameLable
{
    if (_nicknameLable == nil) {
        _nicknameLable = [UILabel new];
        _nicknameLable.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _nicknameLable;
}

-(UIView *)timestampIndicator
{
    if (_timestampIndicator == nil) {
        _timestampIndicator = [UIView new];
        _timestampIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _timestampIndicator;
}

-(UILabel *)timestampLable
{
    if (_timestampLable) {
        _timestampLable = [UILabel new];
        _timestampLable.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _timestampLable;
}

-(UIImageView *)contentImageView
{
    if (_contentImageView) {
        _contentImageView = [UIImageView new];
        _contentImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return _contentImageView;
}

-(UIView *)likeIndicator
{
    if (_likeIndicator) {
        _likeIndicator = [UIView new];
        _likeIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return _likeIndicator;
}

-(UILabel *)likesLabel
{
    if (_likesLabel == nil) {
        _likesLabel = [UILabel new];
        _likesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _likesLabel;
}

-(UIButton *)likeButton
{
    if (_likeButton == nil) {
        _likeButton = [UIButton new];
        _likeButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _likeButton;
}

-(UIButton *)commentButton
{
    if (_commentButton == nil) {
        _commentButton = [UIButton new];
        _commentButton.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _commentButton;
}

-(UIButton *)moireButton
{
    if (_moireButton == nil) {
        _moireButton = [UIButton new];
        _moireButton.translatesAutoresizingMaskIntoConstraints = NO;
    }

    return _moireButton;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.avatarImageView];
    self.avatarImageView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.nicknameLable];
    [self.view addSubview:self.timestampIndicator];
    [self.view addSubview:self.timestampLable];
    [self.view addSubview:self.contentImageView];
    [self.view addSubview:self.likeIndicator];
    [self.view addSubview:self.likesLabel];
    [self.view addSubview:self.likeButton];
    [self.view addSubview:self.commentButton];
    [self.view addSubview:self.moireButton];
    
}

-(void)setupLayoutWithMasonry
{
   [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(self.view).with.offset(10);
       make.top.equalTo(self.view).with.offset(20);
       make.size.mas_equalTo(CGSizeMake(35, 35));
   }];
    
    [_nicknameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avatarImageView.mas_right).with.offset(10);
        
    }];
    
    [_timestampIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_timestampLable.mas_left).with.offset(-10);
        
    }];


}


@end
