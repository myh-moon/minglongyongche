//
//  WeddingDetailTextCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CarListItem.h"

@interface WeddingDetailTextCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupCoinstraints;

@property (nonatomic,strong) UILabel *nameLabel;//车名
@property (nonatomic,strong) UIButton *colorButton;//颜色
@property (nonatomic,strong) UILabel *styleLabel;//款式
@property (nonatomic,strong) UILabel *licenseLabel;//牌照
@property (nonatomic,strong) UILabel *basePriceLabel;//租车 价格
@property (nonatomic,strong) UILabel *presentPriceLabel; //新车参考价格
@property (nonatomic,strong) UIButton *typeButton; //类型
@property (nonatomic,strong) UILabel *speedLabel;  //时速

@property (nonatomic,strong,readwrite) CarListItem *item;

@end
