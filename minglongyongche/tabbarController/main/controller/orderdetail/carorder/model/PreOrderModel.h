//
//  PreOrderModel.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseModel.h"

@interface PreOrderModel : BaseModel

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *oid;
@property (nonatomic,copy) NSString *money;  //金额
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *site; //座位数目
@property (nonatomic,copy) NSString *is_auto; //手动
@property (nonatomic,copy) NSString *belong;  //车牌
@property (nonatomic,copy) NSString *ymoney;  //押金

@end
