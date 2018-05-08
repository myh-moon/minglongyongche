//
//  MyOrderDetailDurationCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"

#import "MyOrderDetailDurationItem.h"

@interface MyOrderDetailDurationCell : BaseCell

@property (nonatomic,strong) UILabel *startLabel;
@property (nonatomic,strong) UILabel *endLabel;
@property (nonatomic,strong) UILabel *durationLabel;
@property (nonatomic,strong) UIImageView *durationImageView;

@property (nonatomic,strong,readwrite) MyOrderDetailDurationItem *item;

@end
