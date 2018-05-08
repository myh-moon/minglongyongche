//
//  LoginAgreeCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "LoginAgreeItem.h"

@interface LoginAgreeCell : BaseCell

@property (nonatomic,strong) UIButton *agreeBtn;
@property (nonatomic,strong) UIButton *contentBtn;

@property (nonatomic,strong) UIButton *loginBtn;

@property (nonatomic,strong) UILabel *orLabel;  //或

@property (nonatomic,strong) UIImageView *llImageView;
@property (nonatomic,strong) UIImageView *rrImageView;
@property (nonatomic,strong) UIButton *registerBtn;

@property (nonatomic,strong,readwrite) LoginAgreeItem *item;

@end
