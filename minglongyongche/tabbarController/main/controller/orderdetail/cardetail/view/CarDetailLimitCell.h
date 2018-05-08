//
//  CarDetailLimitCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "CarDetailLimitItem.h"

@interface CarDetailLimitCell : BaseCell

@property (nonatomic,strong) UILabel *limitLabel;  //用车限制

@property (nonatomic,strong) UIButton *firstButton1;
@property (nonatomic,strong) UIButton *firstButton2;
@property (nonatomic,strong) UIButton *firstButton3;
@property (nonatomic,strong) UIButton *firstButton4;

@property (nonatomic,strong,readwrite) CarDetailLimitItem *item;

@end
