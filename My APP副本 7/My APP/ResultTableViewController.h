//
//  ResultTableViewController.h
//  My APP
//
//  Created by qingyun on 15/12/10.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewController : UITableViewController <UISearchResultsUpdating>

@property (nonatomic,strong) NSArray *datas;

@end
