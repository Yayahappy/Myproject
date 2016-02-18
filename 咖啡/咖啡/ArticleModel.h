//
//  ArticleModel.h
//  咖啡
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ArticleModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *summary;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

@end
