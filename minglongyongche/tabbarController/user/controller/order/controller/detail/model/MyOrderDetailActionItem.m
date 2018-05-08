//
//  MyOrderDetailActionItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailActionItem.h"

@implementation MyOrderDetailActionItem

- (instancetype)initWithMyOrderStatus:(NSString *)status countDownTime:(NSString *)time addTime:(NSString *)addtime {
    self = [super init];
    if (self) {
        
        self.status = status;
        
        if ([status integerValue] == 0) {//未付款状态，，计算倒计时
            
            //有效期截止时间 与 当前时间比较
            //1.获取当前时间
            NSDate *datenow = [NSDate date];//现在时间
            NSString *nowTime = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];

            //2.计算差值
            NSInteger value = [time integerValue] - [nowTime integerValue];
            
            if (value > 0) {//还有倒计时
//                self.countDownTimeString = [NSString stringWithFormat:@"倒计时 %02ld:%02ld:%02ld\n将自动关闭订单",value/3600,(value%3600)/60,(value%3600)%60];
                self.countDownTimeString = [NSString stringWithFormat:@"00:00:00"];
            }else{//倒计时结束
                self.countDownTimeString = [NSString stringWithFormat:@"倒计时 00:00:00\n订单已过期"];

            }
            
            self.second = value;
        }
        
    }
    return self;
}

@end
