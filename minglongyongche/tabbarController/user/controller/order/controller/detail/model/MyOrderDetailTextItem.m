//
//  MyOrderDetailTextItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailTextItem.h"

@implementation MyOrderDetailTextItem

- (instancetype)initWithModel:(CarModel *)model {
    self = [super init];
    if (self) {
        
        NSArray *array = [model.pic componentsSeparatedByString:@","];
        self.img = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
        self.name = model.name;
        self.feature1 = [NSString stringWithFormat:@"%@档",model.is_auto];
        self.feature2 = [NSString stringWithFormat:@"%@座",model.site];
        
        if ([model.belong isEqualToString:@"1"]) {
            self.license = @"沪";
        }else{
            self.license = model.belong;
        }
    }
    return self;
}

@end
