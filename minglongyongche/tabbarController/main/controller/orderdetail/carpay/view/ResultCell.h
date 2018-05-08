//
//  ResultCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "ResultItem.h"

@interface ResultCell : BaseCell

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIImageView *resultImageView;
@property (nonatomic,strong) UILabel *resultLabel;
@property (nonatomic,strong) UILabel *numberLabel1;
@property (nonatomic,strong) UILabel *numberLabel2;
@property (nonatomic,strong) UILabel *wayLabel1;
@property (nonatomic,strong) UILabel *wayLabel2;
@property (nonatomic,strong) UILabel *manLabel1;
@property (nonatomic,strong) UILabel *manLabel2;
@property (nonatomic,strong) UILabel *moneyLabel1;
@property (nonatomic,strong) UILabel *moneyLabel2;

@property (nonatomic,strong) UIButton *resultButton;

@property (nonatomic,strong,readwrite) ResultItem *item;

@end
