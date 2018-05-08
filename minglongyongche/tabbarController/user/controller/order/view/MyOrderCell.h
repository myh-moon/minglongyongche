//
//  MyOrderCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "OrderItem.h"

@interface MyOrderCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIView *backView;  //背景颜色
@property (nonatomic,strong) UILabel *codeLabel;  //订单号
@property (nonatomic,strong) UILabel *licenseLabel; //牌照
//@property (nonatomic,strong) UIButton *checkbutton; //查看详情
@property (nonatomic,strong) UILabel *consumeLabel; //预计消费
@property (nonatomic,strong) UIButton *consumeButton;
@property (nonatomic,strong) UILabel *fromLabel;
@property (nonatomic,strong) UILabel *durationLabel;
@property (nonatomic,strong) UILabel *resultLabel;
@property (nonatomic,strong) UIButton *statusButton;

@property (nonatomic,strong,readwrite) OrderItem *item;

@end
