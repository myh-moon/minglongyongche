//
//  OldDetailConfigCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "WordItem.h"

@interface OldDetailConfigCell : BaseCell


@property (nonatomic,strong) UIButton *configButton1;
@property (nonatomic,strong) UIButton *configButton2;
@property (nonatomic,strong) UIButton *configButton3;
@property (nonatomic,strong) UIButton *configButton4;
@property (nonatomic,strong) UIButton *configButton5;
@property (nonatomic,strong) UIButton *configButton6;

@property (nonatomic,strong,readwrite) WordItem *item;

@end
