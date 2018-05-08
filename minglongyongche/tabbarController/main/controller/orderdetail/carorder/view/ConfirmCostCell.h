//
//  ConfirmCostCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "ConfirmCostItem.h"

@interface ConfirmCostCell : BaseCell

@property (nonatomic,strong) UILabel *chargeLabel;
@property (nonatomic,strong) UIButton *selectButton;
@property (nonatomic,strong) UILabel *costLabel;  //费用合计

@property (nonatomic,strong,readwrite) ConfirmCostItem *item;

@end
