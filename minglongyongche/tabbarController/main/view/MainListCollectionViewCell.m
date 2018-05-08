//
//  MainListCollectionViewCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/20.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MainListCollectionViewCell.h"

@implementation MainListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = MLBackGroundColor;
        
        [self.contentView addSubview:self.carImageView];
        [self.contentView addSubview:self.carSignLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        [self.carImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, smallSpacing, 0, 0) excludingEdge:ALEdgeBottom];
        [self.carImageView autoSetDimension:ALDimensionHeight toSize:160];
        
        [self.carSignLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carImageView];
        [self.carSignLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.carImageView];
        [self.carSignLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
        _carImageView.backgroundColor = MLWhiteColor;
        
        CALayer *layer = [_carImageView layer];
        layer.shadowOffset = CGSizeMake(0, 4);
        layer.shadowColor = MLGrayColor.CGColor;
        layer.shadowOpacity = 0.5;
    }
    return _carImageView;
}

- (UILabel *)carSignLabel {
    if (!_carSignLabel) {
        _carSignLabel = [UILabel newAutoLayoutView];
        _carSignLabel.textColor = MLDrakGrayColor;
        _carSignLabel.text = @"新款新款";
        _carSignLabel.font = MLFont3;
    }
    return _carSignLabel;
}

@end
