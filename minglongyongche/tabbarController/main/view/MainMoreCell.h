//
//  MainMoreCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "UserItem.h"

@interface MainMoreCell : BaseCell

@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic,strong,readwrite) UserItem *item;

@end
