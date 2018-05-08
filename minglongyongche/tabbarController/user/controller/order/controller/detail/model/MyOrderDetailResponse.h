//
//  MyOrderDetailResponse.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseModel.h"
#import "CarModel.h"

@interface MyOrderDetailResponse : BaseModel

@property (nonatomic,copy) NSString *belong;
@property (nonatomic,copy) NSString *is_auto;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *site;
@property (nonatomic,strong) CarModel *order;

@end
