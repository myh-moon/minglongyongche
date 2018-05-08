//
//  PayResultModel.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/28.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayResultModel.h"

@implementation PayResultModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"oid" : @"order.oid",
             @"uid" : @"order.uid",
             @"money" : @"order.money"
             };
}

@end
