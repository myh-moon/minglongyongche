//
//  CarListItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/30.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarListItem.h"


@implementation CarListItem
- (instancetype)initWIthModel:(CarModel *)model
{
    self = [super init];
    if (self) {
        
        NSArray *array = [model.pic componentsSeparatedByString:@","]; //从字符A中分隔成2个元素的数组
        
        self.imgArray  = array;
        
        self.imageName  = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
        
        self.carName = model.name;  //车名
        
        if ([model.belong isEqualToString:@"1"]) {
            self.carLicense = @"沪";
        }else{
            self.carLicense = model.belong;  //牌照
        }
        
//        self.carPrice = [NSString stringWithFormat:@"日租¥%@/天",model.money];  //价格
        self.carPrice = model.money;
        self.carUsedDay = [NSString stringWithFormat:@"已租%@次",model.count];  //已使用的次数
        
        self.collocation = model.collocation;
        //详情
//        self.c = model.collocation;
    }
    return self;
}


@end
