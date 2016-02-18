//
//  SongModel.h
//  CoolMusic
//
//  Created by qingyun on 16/1/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongModel : NSObject

@property (nonatomic,strong) NSString *kName;
@property (nonatomic,strong) NSString *kType;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
