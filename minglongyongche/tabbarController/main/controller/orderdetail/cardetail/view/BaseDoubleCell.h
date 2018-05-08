//
//  BaseDoubleCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/17.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "BaseItem.h"


@interface BaseDoubleCell : BaseCell

@property (nonatomic,strong) UIButton *firstButton;
@property (nonatomic,strong) UIButton *secondButton;

@property (nonatomic,strong,readwrite) BaseItem *item;

@end
