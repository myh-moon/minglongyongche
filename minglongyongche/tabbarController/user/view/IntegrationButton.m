//
//  IntegrationButton.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/18.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "IntegrationButton.h"

@implementation IntegrationButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.btnImageView];
        [self addSubview:self.btnLabel];
        
        self.spaceConstraints = [self.btnLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.btnImageView withOffset:smallSpacing];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.btnImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.btnImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.btnLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.btnImageView];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)btnImageView {
    if (!_btnImageView) {
        _btnImageView = [UIImageView newAutoLayoutView];
    }
    return _btnImageView;
}

- (UILabel *)btnLabel {
    if (!_btnLabel) {
        _btnLabel = [UILabel newAutoLayoutView];
        _btnLabel.textColor = MLGrayColor;
        _btnLabel.font = MLFont1;
    }
    return _btnLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
