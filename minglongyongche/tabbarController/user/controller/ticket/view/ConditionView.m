//
//  ConditionView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConditionView.h"

@implementation ConditionView

- (instancetype)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    if (self) {
        
        CALayer *bottom = [CALayer layer];
        bottom.backgroundColor = MLBackGroundColor.CGColor;
        bottom.frame = CGRectMake(0, 49,[UIScreen mainScreen].bounds.size.width , 1);
        [self.layer addSublayer:bottom];
        
        [self addSubview:self.leftButton];
        [self addSubview:self.centerButton];
        [self addSubview:self.rightButton];
        
        [self addSubview:self.slideLabel];
        
        self.leftConstarints =  [self.slideLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(MLWindowWidth/3 - 70)/2];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.leftButton,self.centerButton,self.rightButton];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0];
        [views autoMatchViewsDimension:ALDimensionHeight];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
//        [self.slideLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.leftButton withOffset:-2];
//        [self.slideLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.leftButton];
        
        [self.slideLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-2];
        [self.slideLabel autoSetDimensionsToSize:CGSizeMake(26, 2)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

#pragma mark - getter
- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton newAutoLayoutView];
        _leftButton.titleLabel.font = MLFont;
        [_leftButton setTitle:@"可用优惠券" forState:0];
        [_leftButton setTitleColor:MLOrangeColor forState:0];
        
        CALayer *layer = [CALayer layer];
        layer.borderColor = MLBackGroundColor.CGColor;
        layer.borderWidth = 1;
        layer.frame = CGRectMake(MLWindowWidth/2-1, 18, 1, 14);
        [_leftButton.layer addSublayer:layer];
        
        MLWeakSelf;
        [_leftButton addAction:^(UIButton *btn) {
            [btn setTitleColor:MLOrangeColor forState:0];
            [weakself.centerButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.rightButton setTitleColor:MLLightGrayColor forState:0];
            
            weakself.leftConstarints.constant = (MLWindowWidth/3-70)/2;
            
            if (weakself.didChooseBtn) {
                weakself.didChooseBtn(123);
            }
            
        }];
    }
    return _leftButton;
}

- (UIButton *)centerButton {
    if (!_centerButton) {
        _centerButton = [UIButton newAutoLayoutView];
        _centerButton.titleLabel.font = MLFont;
        [_centerButton setTitle:@"已用优惠券" forState:0];
        [_centerButton setTitleColor:MLLightGrayColor forState:0];
        
        MLWeakSelf;
        [_centerButton addAction:^(UIButton *btn) {
            [btn setTitleColor:MLOrangeColor forState:0];
            [weakself.leftButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.rightButton setTitleColor:MLLightGrayColor forState:0];

            weakself.leftConstarints.constant = MLWindowWidth/3 + (MLWindowWidth/3-70)/2;
            
            if (weakself.didChooseBtn) {
                weakself.didChooseBtn(124);
            }
        }];
    }
    return _centerButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton newAutoLayoutView];
        _rightButton.titleLabel.font = MLFont;
        [_rightButton setTitle:@"历史优惠券" forState:0];
        [_rightButton setTitleColor:MLLightGrayColor forState:0];
        
        MLWeakSelf;
        [_rightButton addAction:^(UIButton *btn) {
            [btn setTitleColor:MLOrangeColor forState:0];
            [weakself.leftButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.centerButton setTitleColor:MLLightGrayColor forState:0];

            weakself.leftConstarints.constant = MLWindowWidth/3 *2 + (MLWindowWidth/3-70)/2;
            
            if (weakself.didChooseBtn) {
                weakself.didChooseBtn(125);
            }
            
        }];
    }
    return _rightButton;
}

- (UILabel *)slideLabel {
    if (!_slideLabel) {
        _slideLabel = [UILabel newAutoLayoutView];
        _slideLabel.backgroundColor = MLRedColor;
    }
    return _slideLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
