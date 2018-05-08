//
//  MyOrderDetailDurationItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailDurationItem.h"
#import "NSDate+FormatterTime.h"

@implementation MyOrderDetailDurationItem

- (instancetype)initWithStartTime:(NSString *)start endTime:(NSString *)end {
    self = [super init];
    if (self) {
        
        self.starttime = [NSDate getMDWhmFormatterTime:start];
        self.endtime = [NSDate getMDWhmFormatterTime:end];
        
        
        
        
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        //    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//        //处理模型数据时间
//        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeInterval doubleValue]];
//        NSString *dateSMS = [dateFormatter stringFromDate:date];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd H:mm"];
//        dateSMS = [dateFormatter stringFromDate:date];
        
        //计算时间差
        //1.先换算成NSDate
        NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
        [dateFormatter1 setDateFormat:@"yyyy-MM-dd"];
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:[start doubleValue]];
        
        NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
        [dateFormatter2 setDateFormat:@"yyyy-MM-dd"];
        NSDate *date2 =  [NSDate dateWithTimeIntervalSince1970:[end doubleValue]];
        
        //2.计算差值
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *fromDate;
        NSDate *toDate;
        [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:date1];
        [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:date2];
        NSDateComponents *dayComponents = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];

        self.duration = [NSString stringWithFormat:@"%ld天",(long)dayComponents.day];
        
    }
    return self;
}

@end
