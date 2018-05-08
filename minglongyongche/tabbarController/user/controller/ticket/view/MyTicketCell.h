//
//  MyTicketCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "TicketItem.h"

@interface MyTicketCell : BaseCell

@property (nonatomic,strong) UIView *topBackView;
@property (nonatomic,strong) UIView *bottomBackView;


@property (nonatomic,strong) UILabel *sourceLabel;  //来源
@property (nonatomic,strong) UILabel *moneyLabel;
@property (nonatomic,strong) UILabel *expirationLabel; //优惠券截止日期
@property (nonatomic,strong) UILabel *validLabel;  //有效期

@property (nonatomic,strong,readwrite) TicketItem *item;

@end
