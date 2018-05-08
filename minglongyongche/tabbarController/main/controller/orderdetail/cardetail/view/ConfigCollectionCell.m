//
//  ConfigCollectionCell.m
//  minglongyongche
//
//  Created by shiyong_li on 2018/5/6.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfigCollectionCell.h"

@implementation ConfigCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = MLWhiteColor;
        
        [self.contentView addSubview:self.coImageView];
        [self.contentView addSubview:self.coLabel];
        
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
//        [self.coImageView autoSetDimensionsToSize:CGSizeMake(32, 32)];
        [self.coImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.coLabel withOffset:-4];
        [self.coImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self.coLabel];
        
        [self.coLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.coLabel autoSetDimension:ALDimensionHeight toSize:30];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)coImageView{
    if (!_coImageView) {
        _coImageView = [UIImageView newAutoLayoutView];
//        _coImageView.backgroundColor = MLRedColor;
    }
    return _coImageView;
}

- (UILabel *)coLabel {
    if (!_coLabel) {
        _coLabel = [UILabel newAutoLayoutView];
        _coLabel.textColor =  MLGrayColor;
        _coLabel.font = MLFont3;
        _coLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _coLabel;
}


@end
