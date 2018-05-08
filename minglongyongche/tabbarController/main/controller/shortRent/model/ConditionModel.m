//
//  ConditionModel.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConditionModel.h"

@implementation ConditionModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return  @{
              @"pid" : @"id"
              };
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"child" : @"ConditionChildModel"
             };
}

@end
