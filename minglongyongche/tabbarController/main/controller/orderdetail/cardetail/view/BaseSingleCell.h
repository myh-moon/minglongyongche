//
//  BaseSingleCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "BaseItem.h"

@interface BaseSingleCell : BaseCell

@property (nonatomic,strong) UIButton *singleButton;

@property (nonatomic,strong,readwrite) BaseItem *item;

@end
