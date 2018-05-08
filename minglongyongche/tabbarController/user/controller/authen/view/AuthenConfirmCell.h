//
//  AuthenConfirmCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "AuthernConfirmItem.h"

@interface AuthenConfirmCell : BaseCell

@property (nonatomic,strong) UIButton *confirmButton;

@property (nonatomic,strong,readwrite) AuthernConfirmItem *item;

@end
