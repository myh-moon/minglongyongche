//
//  MyOrderDetailActionCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import <JKCountDownButton/JKCountDownButton.h>
#import "MyOrderDetailActionItem.h"

@interface MyOrderDetailActionCell : BaseCell

@property (nonatomic,strong) JKCountDownButton *countDownButton;

@property (nonatomic,strong) UIButton *actionButton1;
@property (nonatomic,strong) UIButton *actionButton2;

@property (nonatomic,strong,readwrite) MyOrderDetailActionItem *item;

@end
