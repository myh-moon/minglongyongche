//
//  ConfirmBottomView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmBottomView.h"

@implementation ConfirmBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(0, 0, MLWindowWidth, 1);
//        layer.borderColor = MLBackGroundColor.CGColor;
//        [self.layer addSublayer:layer];
        
        self.backgroundColor = MLBackGroundColor;
        
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.leftButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.leftButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
//        [self.rightButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.rightButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(smallSpacing, 0, smallSpacing, middleSpacing) excludingEdge:ALEdgeLeft];
        [self.rightButton autoSetDimension:ALDimensionWidth toSize:160];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton newAutoLayoutView];
        [_leftButton setTitleColor:MLGrayColor forState:0];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton newAutoLayoutView];
        _rightButton.backgroundColor = MLOrangeColor;
        [_rightButton setTitleColor:MLWhiteColor forState:0];
        [_rightButton setTitle:@"提交订单" forState:0];
        _rightButton.titleLabel.font = MLFont5;
    }
    return _rightButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
