//
//  PayCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"

#import "TicketItem.h"

@interface PayCell : BaseCell

@property (nonatomic,strong) UIButton *payButton;
@property (nonatomic) UIButton *ssButton;

@property (nonatomic,strong,readwrite) TicketItem *item;

@end
