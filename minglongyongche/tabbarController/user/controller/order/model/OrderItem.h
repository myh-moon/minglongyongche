//
//  OrderItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"
#import "CarModel.h"

@interface OrderItem : BaseItem

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *license;
@property (nonatomic,copy) NSString *pic;

@property (nonatomic,copy) NSString *money;


@property (nonatomic,copy) NSString *qctime;
@property (nonatomic,copy) NSString *hctime;
//@property (nonatomic,copy) NSString *qcaddress;
//@property (nonatomic,copy) NSString *hcaddress;

@property (nonatomic,copy) NSString *feature1;
@property (nonatomic,copy) NSString *feature2;


@property (nonatomic,copy) NSString *result;
@property (nonatomic,copy) NSString *status;



- (instancetype) initWithOrderModel:(CarModel *)model;

@end
