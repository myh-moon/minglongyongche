//
//  ConfirmDateItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/23.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmDateItem.h"

@implementation ConfirmDateItem

- (instancetype)initWithString:(NSString *)addressString {
    self = [super init];
    if (self) {
        self.addressStr = addressString;
    }
    return self;
}

- (instancetype)initWithStartDate:(NSString *)startdate startTime:(NSString *)starttime endDate:(NSString *)enddate endTime:(NSString *)endtime duration:(NSString *)duration zuqi:(NSString *)zuqi {
    self = [super init];
    if (self) {
        self.startDate = startdate;
        self.startTime = starttime;
        self.endDate = enddate;
        self.endTime = endtime;
        self.duration = duration;
        self.zuqi = zuqi;
    }
    return self;
}

@end
