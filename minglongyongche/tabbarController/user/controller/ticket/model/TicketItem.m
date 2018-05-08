//
//  TicketItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "TicketItem.h"
#import "NSDate+FormatterTime.h"

@implementation TicketItem

- (instancetype)initWithTicketModel:(TicketModel *)model {
    self = [super init];
    if (self) {
//        self.name = [NSString stringWithFormat:@"%@元优惠券",model.money];
////        self.name =  [NSString stringWithFormat:@"%@",model.money];
//        self.status = model.status;
//
//        NSString *starttime = [NSDate getYMDhmFormatterTime:model.stime];
//        NSString *endtime = [NSDate getYMDhmFormatterTime:model.etime];
//
//        self.note = [NSString stringWithFormat:@"有效期：%@ - %@",starttime,endtime];
        
        NSArray *infos = [model.info componentsSeparatedByString:@"<"];
        for (NSInteger i=0; i<infos.count; i++) {
            self.source = [NSString stringWithFormat:@"%@\n%@\n",infos[0],[infos[1] substringFromIndex:2]];
            self.sourceDetail1 = [NSString stringWithFormat:@"%@\n",[infos[3] substringFromIndex:2]];
            self.sourceDetail2 =  [NSString stringWithFormat:@"%@\n",[infos[4] substringFromIndex:3]];
        }
        
        self.money = model.money;
        
        NSString *end = [NSDate getAnotherYMDhmsFormatterTime:model.etime];
        self.validDays = [NSString stringWithFormat:@"有效期至%@",end];
        
        if ([model.status integerValue] == 2) {
            self.overdueTime = @"已过期";
        }else if([model.status integerValue] == 1){
            self.overdueTime = @"已使用";
        }else{
            //有效期截止时间 与 当前时间比较
            //1.获取当前时间
            NSDate *datenow = [NSDate date];//现在时间
            NSString *nowTime = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
            
            //2.计算差值
            NSInteger value = [model.etime integerValue] - [nowTime integerValue];
            if (value > 0) {//还在有效期内
                int second = (int)value %60;//秒
                int minute = (int)value / 60 % 60;
                int house = (int)value / 3600;
                int day = (int)value / (24 * 3600);
                
                if (day != 0) {
                    self.overdueTime = [NSString stringWithFormat:@"将在%d天后过期",day];
                }else if (day==0 && house != 0) {
                    self.overdueTime = [NSString stringWithFormat:@"将在%d小时后过期",house];
                }else if (day== 0 && house== 0 && minute!=0) {
                    self.overdueTime = [NSString stringWithFormat:@"将在%d分钟后过期",minute];
                }else{
                    self.overdueTime = [NSString stringWithFormat:@"将在%d秒后过期",second];
                }
            }
        }
        
    }
    return self;
}

- (instancetype)initWithOrderTicketModel:(TicketModel *)model validStartTime:(NSDate *)start validEndTime:(NSDate *)end {
    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"%@元优惠券",model.money];
        self.status = model.status;
        
        NSString *starttime = [NSDate getYMDhmFormatterTime:model.stime];
        NSString *endtime = [NSDate getYMDhmFormatterTime:model.etime];
        
        self.note = [NSString stringWithFormat:@"有效期：%@ - %@",starttime,endtime];

    }
    return self;
}

@end
