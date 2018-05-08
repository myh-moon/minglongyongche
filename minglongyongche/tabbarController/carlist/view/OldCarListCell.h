//
//  OldCarListCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CarListItem.h"

@interface OldCarListCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIButton *carImageButton;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *situationLabel;
@property (nonatomic,strong) UILabel *statusLabel;

@property (nonatomic,strong,readwrite) CarListItem *item;

@end
