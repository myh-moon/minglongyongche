//
//  CarDetailTipsCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "CarDetailTipsItem.h"

@interface CarDetailTipsCell : BaseCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong,readwrite) CarDetailTipsItem *item;

@end
