//
//  ConfirmDateCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "ConfirmDateItem.h"

@interface ConfirmDateCell : BaseCell

@property (nonatomic,strong) UIButton *dateFromButton;
@property (nonatomic,strong) UILabel *durationLabel;
@property (nonatomic,strong) UIImageView *lineImageView;
@property (nonatomic,strong) UILabel *ddLabel;
@property (nonatomic,strong) UIButton *dateEndButton;

@property (nonatomic,strong) NSDate *startDa;
@property (nonatomic,strong) NSDate *endDa;

@property (nonatomic,strong,readwrite) ConfirmDateItem *item;

@end
