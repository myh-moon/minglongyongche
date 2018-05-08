//
//  OldDetailTextCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "CarListItem.h"

@interface OldDetailTextCell : BaseCell

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *costButton;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *taxationLabel;

@property (nonatomic,strong,readwrite) CarListItem *item;

@end
