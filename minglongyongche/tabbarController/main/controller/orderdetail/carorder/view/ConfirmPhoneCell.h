//
//  ConfirmPhoneCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "ConfirmPhoneItem.h"

@interface ConfirmPhoneCell : BaseCell

//@property (nonatomic,strong) UITextField *titleTextField;

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic,strong) UIImageView *lineImageView;


@property (nonatomic,strong,readwrite)ConfirmPhoneItem *item;

@end
