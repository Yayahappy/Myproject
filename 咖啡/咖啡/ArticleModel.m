//
//  ArticleModel.m
//  咖啡
//
//  Created by qingyun on 16/1/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{


}
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
