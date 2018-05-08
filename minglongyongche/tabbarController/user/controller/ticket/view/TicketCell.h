//
//  TicketCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "TicketItem.h"

@interface TicketCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIImageView *backView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *noteLabel;

@property (nonatomic,strong,readwrite) TicketItem *item;

@end
