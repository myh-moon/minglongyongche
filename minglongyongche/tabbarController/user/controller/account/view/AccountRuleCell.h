//
//  AccountRuleCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AccountRuleItem.h"

@interface AccountRuleCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *ruleButton1;
@property (nonatomic,strong) UIButton *ruleButton2;
@property (nonatomic,strong) UIButton *ruleButton3;

@property (nonatomic,strong,readwrite) AccountRuleItem *item;

@end
