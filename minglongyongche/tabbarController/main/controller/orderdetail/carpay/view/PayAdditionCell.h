//
//  PayAdditionCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "ConfirmDateItem.h"

@interface PayAdditionCell : BaseCell

@property (nonatomic,strong) UIButton *rrButton;

@property (nonatomic,strong,readwrite) ConfirmDateItem *item;

@end
