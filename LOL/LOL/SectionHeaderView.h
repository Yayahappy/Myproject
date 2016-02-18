//
//  SectionHeaderView.h
//  
//
//  Created by qingyun on 15/12/4.
//
//

#import <UIKit/UIKit.h>
@class FriendGroup;

@interface SectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic,strong) FriendGroup *friendGroup;

@property (nonatomic,strong) void (^headerViewClick)(void);


+(instancetype)sectionHeaderViewForTableView:(UITableView *)tableView;

@end
