//
//  ResultItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ResultItem.h"

@implementation ResultItem

- (instancetype)initWithPayResultModel:(PayResultModel *)model {
    self = [super init];
    if (self) {
        self.number = model.oid;
        self.way = @"微信支付";
        self.man = model.uid;
        self.money = [NSString stringWithFormat:@"¥%@",model.money];
    }
    return self;
}

//- (instancetype)initWithFlag:(NSString *)flag resultNumber:(NSString *)number resultWay:(NSString *)way resultMan:(NSString *)man resultMoney:(NSString *)money {
//    self = [super init];
//    if (self) {
//        self.resultFlag = flag;
//        self.number = number;
//        self.way = way;
//        self.man = man;
//        self.money = money;
//    }
//    return self;
//}

@end
