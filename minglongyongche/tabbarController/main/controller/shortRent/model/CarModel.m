//
//  CarModel.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/1.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
//             @"uid" : @"id"
             @"ID" : @"id",
             @"statuss" : @"status"
             };
}

@end
