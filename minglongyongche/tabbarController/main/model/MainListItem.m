//
//  MainListItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/18.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MainListItem.h"

@implementation MainListItem

- (instancetype)initWithHotList:(NSArray *)hotArray {
    self = [super init];
    if (self) {
        
        self.hotList = hotArray;
//        CarModel *model = hotArray[]
        
        
//        NSArray *array = [model.pic componentsSeparatedByString:@","]; //从字符A中分隔成2个元素的数组
//        self.carImage  = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
//        self.carTitle = model.name;
    }
    return self;
}

//- (instancetype)initWithModel:(CarModel *)model {
//    self = [super init];
//    if (self) {
//        NSArray *array = [model.pic componentsSeparatedByString:@","]; //从字符A中分隔成2个元素的数组
//        self.carImage  = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
//        self.carTitle = model.name;
//    }
//    return self;
//}

@end
