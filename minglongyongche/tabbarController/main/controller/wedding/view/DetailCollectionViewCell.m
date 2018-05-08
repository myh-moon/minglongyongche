//
//  DetailCollectionViewCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "DetailCollectionViewCell.h"

@implementation DetailCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self.contentView addSubview:self.textLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.textLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel newAutoLayoutView];
        _textLabel.textColor = MLLightGrayColor;
        _textLabel.font = MLFont3;
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}

@end
