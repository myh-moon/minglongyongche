//
//  ConfirmMessageItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"
#import "CarModel.h"
#import "PreOrderModel.h"
@interface ConfirmMessageItem : BaseItem

@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *license;
@property (nonatomic,copy) NSString *feature1;
@property (nonatomic,copy) NSString *feature2;

- (instancetype) initWithModel:(CarModel *)model;

- (instancetype) initWithPreOrderModel:(PreOrderModel *)model;

@end
