//
//  NSDate+FormatterTime.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/23.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FormatterTime)

+ (NSString *)getYMDhmFormatterTime:(NSString *)timeInterval;

//2018年12月12日 12:00:00
+ (NSString *)getYMDhmsFormatterTime:(NSString *)timeInterval;


//星期 04月28日 周三 12:00
+ (NSString *)getMDWhmFormatterTime:(NSString *)timeInterval;


//2019.4.12 09:09
+ (NSString *)getAnotherYMDhmsFormatterTime:(NSString *)timeInterval;


@end
