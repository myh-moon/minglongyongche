//
//  AccountPayItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AccountPayItem.h"

@implementation AccountPayItem

- (id)initWithAction:(NSString *)actionString {
    self = [super init];
    if (self) {
        self.actStr = actionString;
    }
    return self;
}

@end
