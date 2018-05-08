//
//  PayMoneyCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "PayMoneyItem.h"

@interface PayMoneyCell : BaseCell

@property (nonatomic,strong) UIButton *leftbutton;
@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic,strong,readwrite) PayMoneyItem *item;

@end
