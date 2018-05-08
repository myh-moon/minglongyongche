//
//  NSDate+FormatterTime.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/23.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NSDate+FormatterTime.h"

@implementation NSDate (FormatterTime)

+ (NSString *)getYMDhmFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy-MM-dd H:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}

+ (NSString *)getMDWhmFormatterTime:(NSString *)timeInterval {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSArray *weekdayAry = [NSArray arrayWithObjects:@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    [dateFormatter setShortWeekdaySymbols:weekdayAry];
    
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"MM月dd日 \n EEEE H:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}


+ (NSString *)getYMDhmsFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 H:mm:ss"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}

+ (NSString *)getAnotherYMDhmsFormatterTime:(NSString *)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //处理模型数据时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
    NSString *dateSMS = [dateFormatter stringFromDate:date];
    [dateFormatter setDateFormat:@"yyyy.MM.dd H:mm"];
    dateSMS = [dateFormatter stringFromDate:date];
    return dateSMS;
}

@end
