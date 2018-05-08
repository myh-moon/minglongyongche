//
//  CarDetailTextCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CarDetailItem.h"

@interface CarDetailTextCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UILabel *carNameLabel;  //车名
@property (nonatomic,strong) UILabel *carBrandLabel;  //车牌
@property (nonatomic,strong) UILabel *presentPriceLabel; //现价
@property (nonatomic,strong) UILabel *originalPriceLabel;//原价
@property (nonatomic,strong) UILabel *carSignLabel; //精选特惠
@property (nonatomic,strong) UILabel *carUsedLabel;  //已使用次数
@property (nonatomic,strong) UILabel *addressLabel; //地址
@property (nonatomic,strong) UIButton *distanceBtn;  //距离



//@property (nonatomic,strong) UIImageView *carSigImageView;  //标记
//@property (nonatomic,strong) UILabel *carBriefLabel; //简介

//查看距离
@property (nonatomic,strong) void (^didClickDistance)(UIButton *btn);

@property (nonatomic,strong,readwrite) CarDetailItem *item;




@end
