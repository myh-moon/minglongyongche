//
//  MyOrderDetailNumberItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailNumberItem.h"
#import "NSDate+FormatterTime.h"

@implementation MyOrderDetailNumberItem

- (instancetype)initWithInfo:(NSString *)info detailString:(NSString *)detailStr {
    self = [super init];
    if (self) {
        self.info = info;
        
        if ([info isEqualToString:@"下单时间"]) {
            self.detail = [NSDate getYMDhmFormatterTime:detailStr];
        }else if ([info isEqualToString:@"订单金额"]){
            self.detail = [NSString stringWithFormat:@"支付 ¥ %@",detailStr];
        }else if ([info isEqualToString:@"用车押金（到店支付）"]){
            self.detail = [NSString stringWithFormat:@"¥ %@",detailStr];
        }else{
            self.detail = detailStr;
        }
        
    }
    return self;
}

@end
