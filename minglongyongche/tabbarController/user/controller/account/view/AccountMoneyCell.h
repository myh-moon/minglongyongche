//
//  AccountMoneyCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AccountCell.h"
#import "AccountMoneyItem.h"

@interface AccountMoneyCell : RETableViewCell


@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *singleButton;

@property (nonatomic,strong,readwrite) AccountMoneyItem *item;

@end
