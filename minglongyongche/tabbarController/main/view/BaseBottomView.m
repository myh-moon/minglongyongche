//
//  BaseBottomView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseBottomView.h"

@implementation BaseBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.leftBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.leftBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        [self.leftBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        [self.leftBtn autoSetDimension:ALDimensionWidth toSize:[UIScreen mainScreen].bounds.size.width * _multiple];
        
        [self.rightBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.rightBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        [self.rightBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        [self.rightBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.leftBtn];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton newAutoLayoutView];
        [_leftBtn setTitleColor:MLWhiteColor forState:0];
        _leftBtn.backgroundColor = MLLightGrayColor;
        _leftBtn.tag  = 56;
        
        MLWeakSelf;
        [_leftBtn addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(56);
            }
        }];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton newAutoLayoutView];
        [_rightBtn setTitleColor:MLWhiteColor forState:0];
        _rightBtn.backgroundColor = MLGrayColor;
        _rightBtn.tag = 57;
        
        MLWeakSelf;
        [_rightBtn addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(57);
            }
        }];
    }
    return _rightBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
