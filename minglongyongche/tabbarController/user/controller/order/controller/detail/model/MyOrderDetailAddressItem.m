//
//  MyOrderDetailAddressItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailAddressItem.h"

@implementation MyOrderDetailAddressItem

- (instancetype)initWithOrderAddress:(NSString *)address {
    self = [super init];
    if (self) {
        self.qcaddress = address;
    }
    return self;
}

@end
