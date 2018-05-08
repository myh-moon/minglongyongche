//
//  ResultItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"
#import "PayResultModel.h"

@interface ResultItem : BaseItem

@property (nonatomic,copy) NSString *resultFlag;  //订单支付结果1，2，3

@property (nonatomic,copy) NSString *number;
@property (nonatomic,copy) NSString *way;
@property (nonatomic,copy) NSString *man;
@property (nonatomic,copy) NSString *money;

//- (instancetype) initWithFlag:(NSString *)flag  resultNumber:(NSString *)number resultWay:(NSString *)way resultMan:(NSString *)man resultMoney:(NSString *)money;

- (instancetype) initWithPayResultModel:(PayResultModel *)model;

@end
