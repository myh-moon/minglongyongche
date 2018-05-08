//
//  IllegalCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "IllegalItem.h"

@interface IllegalCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIView *backView;  //背景颜色
@property (nonatomic,strong) UILabel *codeLabel;  //订单号
@property (nonatomic,strong) UILabel *licenseLabel; //牌照
@property (nonatomic,strong) UIButton *checkbutton; //查看详情
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *resultLabel;
@property (nonatomic,strong) UIButton *placeButton;

@property (nonatomic,strong,readwrite) IllegalItem *item;

@end
