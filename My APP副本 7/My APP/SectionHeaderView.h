//
//  SectionHeaderView.h
//  My APP
//
//  Created by qingyun on 15/12/8.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NameGroup;

@interface SectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic,strong) NameGroup *nameGroup;

@property (nonatomic,strong) void (^headerViewClick)(void);


+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView;

@end
