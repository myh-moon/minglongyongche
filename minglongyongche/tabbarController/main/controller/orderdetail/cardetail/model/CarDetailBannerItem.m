//
//  CarDetailBannerItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarDetailBannerItem.h"

@implementation CarDetailBannerItem

- (instancetype)initWithCarModel:(CarModel *)model {
    self = [super init];
    
    if (self) {
        NSArray *arr = [model.pic componentsSeparatedByString:@","];
        self.imgArray = arr;
    }
    return self;
}

@end
