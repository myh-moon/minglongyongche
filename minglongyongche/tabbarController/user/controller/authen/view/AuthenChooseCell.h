//
//  AuthenChooseCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/27.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "AuthenChooseItem.h"

@interface AuthenChooseCell : BaseCell

@property (nonatomic,strong) UIButton *dateButton;

@property (nonatomic,strong,readwrite) AuthenChooseItem *item;

@end
