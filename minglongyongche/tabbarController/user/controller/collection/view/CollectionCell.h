//
//  CollectionCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "CarListItem.h"

@interface CollectionCell : BaseCell

@property (nonatomic,strong) UIView *coBackView;


@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *lisenceLabel;
@property (nonatomic,strong) UILabel *qualityLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *countLabel;

//@property (nonatomic,strong) UIButton *cancelButton;  //取消收藏

@property (nonatomic,strong,readwrite) CarListItem *item;

@end
