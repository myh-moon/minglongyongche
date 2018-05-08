//
//  ConfirmTicketCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/28.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "ConfirmTicketItem.h"

@interface ConfirmTicketCell : BaseCell

@property (nonatomic,strong) UILabel *ticketLabel;
@property (nonatomic,strong) UIButton *ticketButton;

@property (nonatomic,strong,readwrite) ConfirmTicketItem *item;

@end
