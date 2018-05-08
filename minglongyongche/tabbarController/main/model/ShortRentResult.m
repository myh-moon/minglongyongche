//
//  ShortRentResult.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ShortRentResult.h"
#import "CarModel.h"

@implementation ShortRentResult

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"lease" : @"CarModel"
             };
}

@end
