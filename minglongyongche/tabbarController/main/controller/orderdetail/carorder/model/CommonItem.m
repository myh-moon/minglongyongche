//
//  CommonItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CommonItem.h"

@implementation CommonItem

- (instancetype)initWithLeftText:(NSString *)leftString rightText:(NSString *)rightString {
    self = [super init];
    if (self) {
        self.leftStr = leftString;
        self.rightStr = rightString;
    }
    return self;
}

@end
