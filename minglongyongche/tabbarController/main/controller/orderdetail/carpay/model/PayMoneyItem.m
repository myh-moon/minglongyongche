//
//  PayMoneyItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayMoneyItem.h"

@implementation PayMoneyItem
- (instancetype)initWithLeftText:(NSString *)leftStr rightText:(NSString *)rightStr type:(NSString *)type {
    self = [super init];
    if (self) {
        self.deposit = leftStr;
        self.surplus = rightStr;
        self.type = type;
    }
    return self;
}

@end
