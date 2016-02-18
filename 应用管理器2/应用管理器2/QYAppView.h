//
//  QYAppView.h
//  应用管理器2
//
//  Created by qingyun on 15/11/18.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYApp;
@interface QYAppView : UIView

@property (nonatomic,strong) QYApp *model;
+(instancetype)appView;

@end
