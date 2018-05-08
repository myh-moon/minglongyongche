//
//  ActivityCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CarListItem.h"

@interface ActivityCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIButton *activityBannerButton;
@property (nonatomic,strong) UILabel *activityNameLabel;
@property (nonatomic,strong) UIButton *lookedButton;
@property (nonatomic,strong) UIButton *statusButton;

@property (nonatomic,strong,readwrite) CarListItem *item;

@end
