//
//  LoginCodeCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import <JKCountDownButton/JKCountDownButton.h>
#import "LoginCodeItem.h"

@interface LoginCodeCell : BaseCell

@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) JKCountDownButton *codeButton;

@property (nonatomic,strong,readwrite) LoginCodeItem *item;

@end
