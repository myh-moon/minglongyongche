//
//  MainSingleCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "MainSingleItem.h"

@interface MainSingleCell : BaseCell

@property (nonatomic,strong) UIButton *lpButton;

@property (nonatomic,strong,readwrite) MainSingleItem *item;

@end
