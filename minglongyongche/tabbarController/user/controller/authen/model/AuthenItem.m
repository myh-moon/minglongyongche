//
//  AuthenItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AuthenItem.h"

@implementation AuthenItem

- (instancetype)initWithLeftName:(NSString *)name placeholder:(NSString *)placeHoleder {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.placeholder = placeHoleder;
    }
    return self;
}

@end
