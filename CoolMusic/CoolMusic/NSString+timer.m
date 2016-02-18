//
//  NSString+timer.m
//  CoolMusic
//
//  Created by qingyun on 16/1/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSString+timer.h"

@implementation NSString (timer)

-(NSString *)valueEXchange:(NSTimeInterval)timer
{
    int minute = (float)timer/60;
    int second = (int)timer%60;
    
    NSString *strminume;
    if (minute>10) {
        strminume = [NSString stringWithFormat:@"%d",minute];
    }else{
        strminume = [NSString stringWithFormat:@"0%d",minute];
    }
    
    NSString *strsecond;
    if (second>10) {
        strsecond = [NSString stringWithFormat:@"%d",second];
    }else{
        strsecond = [NSString stringWithFormat:@"0%d",second];
    }
    
    return [NSString stringWithFormat:@"%@,%@",strminume,strsecond];
}

@end
