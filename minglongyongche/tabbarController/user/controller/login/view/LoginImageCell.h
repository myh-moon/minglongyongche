//
//  LoginImageCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "LoginImageItem.h"

@interface LoginImageCell : BaseCell

@property (nonatomic,strong) UIButton *imgBtn;

@property (nonatomic,strong,readwrite) LoginImageItem *item;

@end
