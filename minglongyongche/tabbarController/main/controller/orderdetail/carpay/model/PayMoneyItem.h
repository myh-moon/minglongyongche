//
//  PayMoneyItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"

@interface PayMoneyItem : BaseItem

@property (nonatomic,copy) NSString *deposit; //押金
@property (nonatomic,copy) NSString *surplus;//剩余金额
@property (nonatomic,copy) NSString *type;

- (instancetype) initWithLeftText:(NSString *)leftStr rightText:(NSString *)rightStr type:(NSString *)type;

@end
