//
//  OldDetailCostCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "OrderItem.h"

@interface OldDetailCostCell : BaseCell

@property (nonatomic,strong) UILabel *serviceCostLabel;
@property (nonatomic,strong) UIButton *checkMoreButton;
@property (nonatomic,strong) UIButton *serviceButton1;
@property (nonatomic,strong) UIButton *serviceButton2;
@property (nonatomic,strong) UIButton *serviceButton3;

@property (nonatomic,strong,readwrite) OrderItem *item;

@end
