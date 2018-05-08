//
//  LoginCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "LoginItem.h"

@interface LoginCell : BaseCell

@property (nonatomic,strong) UILabel *codeLabel;
@property (nonatomic,strong) UITextField *codeTextField;

@property (nonatomic,strong,readwrite) LoginItem *item;


@end
