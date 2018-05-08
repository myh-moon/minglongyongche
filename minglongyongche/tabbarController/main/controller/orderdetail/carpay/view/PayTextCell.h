//
//  PayTextCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "BaseItem.h"

@interface PayTextCell : BaseCell

@property (nonatomic,strong) UIButton *ttButton;

@property (nonatomic,strong,readwrite) BaseItem *item;
@end
