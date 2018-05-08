//
//  MyOrderDetailAddressCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailAddressItem.h"

@interface MyOrderDetailAddressCell : BaseCell

@property (nonatomic,strong) UILabel *infoLabel;
@property (nonatomic,strong) UIButton *addressButton;
@property (nonatomic,strong) UILabel *addressLabel;

@property (nonatomic,strong,readwrite) MyOrderDetailAddressItem *item;

@end
