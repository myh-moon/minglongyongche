//
//  ConfirmDateItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/23.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"

@interface ConfirmDateItem : BaseItem

@property (nonatomic,copy) NSString *addressStr;

//订单日期选择

@property (nonatomic,copy) NSString *startMoments;  //开始时刻
@property (nonatomic,copy) NSString *endMoments; //结束时刻

@property (nonatomic,copy) NSString *startDate;
@property (nonatomic,copy) NSString *startTime;
@property (nonatomic,copy) NSString *endDate;
@property (nonatomic,copy) NSString *endTime;
@property (nonatomic,copy) NSString *duration;
@property (nonatomic,copy) NSString *zuqi;

//- (instancetype) initWithStartTime:(NSString *)startime endTime:(NSString *)endtime duration:(NSString *)duration zuqi:(NSString *)zuqi;

- (instancetype) initWithStartDate:(NSString *)startdate startTime:(NSString *)starttime endDate:(NSString *)enddate endTime:(NSString *)endtime duration:(NSString *)duration zuqi:(NSString *)zuqi;

- (instancetype) initWithString:(NSString *)addressString;



@end
