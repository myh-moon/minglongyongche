//
//  UserCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "UserItem.h"

@interface UserCell : BaseCell

@property (nonatomic,strong) UIButton *settingButton;  //设置按钮
@property (nonatomic,strong) UIImageView *userImageView;
@property (nonatomic,strong) UIButton *userNameButton;
@property (nonatomic,strong) UIButton *userAuthenBtn;

@property (nonatomic,strong,readwrite) UserItem *item;


@end
