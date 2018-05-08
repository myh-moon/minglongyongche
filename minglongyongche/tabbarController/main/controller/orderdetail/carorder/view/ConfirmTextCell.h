//
//  ConfirmTextCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "WordItem.h"

@interface ConfirmTextCell : BaseCell

@property (nonatomic,strong) UIButton *messageButton;

@property (nonatomic,strong,readwrite) WordItem *item;

@end
