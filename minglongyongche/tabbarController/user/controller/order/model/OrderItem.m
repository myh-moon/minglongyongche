//
//  OrderItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OrderItem.h"
#import "NSDate+FormatterTime.h"

@implementation OrderItem

- (instancetype)initWithOrderModel:(CarModel *)model {
    self = [super init];
    
    if (self) {
        
        NSArray *array = [model.pic componentsSeparatedByString:@","];
        self.pic = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
        
        self.name = model.name;
        
        if ([model.belong isEqualToString:@"1"]) {
            self.license = @"沪";
        }else{
            self.license = model.belong;
        }
        
        
        if ([model.is_auto integerValue] == 2) {
            self.feature1 = @"手动挡";
        }else{
            self.feature1 = @"自动挡";
        }
        self.feature2 = [NSString stringWithFormat:@"%@座",model.site];
        
        
        self.qctime = [NSDate getYMDhmsFormatterTime:model.qctime];
        self.hctime = [NSDate getYMDhmsFormatterTime:model.hctime];
        self.money = model.money;
        
        self.status = model.statuss;
        
    }
    
    return self;
}


//- (instancetype)initWithOrderModel:(id)model
//
//- (instancetype)initWithOrderModel:(id)model {
//
//    self = [super init];
//    if (self) {
//
//        self.name = model.name;
//
//    }
//
//    return self;
//
//}



@end
