//
//  ConfirmMessageItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmMessageItem.h"

@implementation ConfirmMessageItem

- (instancetype)initWithModel:(CarModel *)model {
    self = [super init];
    if (self) {
        
        NSArray *array = [model.pic componentsSeparatedByString:@","];
        self.img = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
        self.name = model.name;
        if ([model.belong isEqualToString:@"1"]) {
            self.license = @"沪";
        }else{
            self.license = model.belong;
        }
        self.feature1 = [NSString stringWithFormat:@"%@档",model.is_auto];
        self.feature2 = [NSString stringWithFormat:@"%@座",model.site];
    }
    return self;
}

- (instancetype)initWithPreOrderModel:(PreOrderModel *)model {
    self = [super init];
    if (self) {
        
        NSArray *array = [model.pic componentsSeparatedByString:@","];
        self.img = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
        self.name = model.name;
        
        if ([model.belong isEqualToString:@"1"]) {
            self.license = @"沪";
        }else{
            self.license = model.belong;
        }
        
        self.feature1 = model.is_auto;
        self.feature2 = [NSString stringWithFormat:@"%@座",model.site];
    }
    return self;
    
}

@end
