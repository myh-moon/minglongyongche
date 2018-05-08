//
//  BaseItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"

@implementation BaseItem

- (instancetype)initWithTitle:(NSString *)firstString firstImage:(NSString *)imgString secondText:(NSString *)secondString {
    self = [super init];
    if (self) {
        self.titleImageString = imgString;
        self.firstTitleString = firstString;
        self.secondTextString = secondString;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)firstString firstImage:(NSString *)imgString {
    self = [super init];
    if (self) {
        self.titleImageString = imgString;
        self.firstTitleString = firstString;
    }
    return self;
}

@end
