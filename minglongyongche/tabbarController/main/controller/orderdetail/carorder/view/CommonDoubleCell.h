//
//  CommonDoubleCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "CommonItem.h"

@interface CommonDoubleCell : BaseCell


@property (nonatomic,strong) UIButton *firstButton;
@property (nonatomic,strong) UIButton *secondButton;

@property (nonatomic,strong,readwrite) CommonItem *item;


@end
