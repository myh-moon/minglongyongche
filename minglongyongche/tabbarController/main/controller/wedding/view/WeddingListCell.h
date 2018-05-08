//
//  WeddingListCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CarListItem.h"

@interface WeddingListCell : RETableViewCell


@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIView *backView; //背景框
@property (nonatomic,strong) UIImageView *carImageView; //车图片
@property (nonatomic,strong) UILabel *carNameLabel; //车名
@property (nonatomic,strong) UILabel *carColorLabel; //颜色
@property (nonatomic,strong) UIButton *typeButton;//主推车
@property (nonatomic,strong) UILabel *carPriceLabel;//价格
@property (nonatomic,strong) UILabel *carUsedLabel;//已使用次数

@property (nonatomic,strong,readwrite) CarListItem *item;

@end
