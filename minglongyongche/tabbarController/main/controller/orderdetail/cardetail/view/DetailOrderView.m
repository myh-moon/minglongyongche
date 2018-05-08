//
//  DetailOrderView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "DetailOrderView.h"

@implementation DetailOrderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(0, 0, MLWindowWidth, 0.4);
//        layer.backgroundColor =  [UIColor colorWithRed:0.9647 green:0.9647 blue:0.9647 alpha:1].CGColor;
//        [self.layer addSublayer:layer];
        
        self.backgroundColor = MLBackGroundColor;
        
        [self addSubview:self.collectionButton];
        [self addSubview:self.orderButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.collectionButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeRight];
        [self.collectionButton autoSetDimension:ALDimensionWidth toSize:MLWindowWidth*0.3];
        
        [self.orderButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(smallSpacing, 0, smallSpacing, middleSpacing) excludingEdge:ALEdgeLeft];
        [self.orderButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.collectionButton withOffset:middleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (IntegrationButton *)collectionButton {
    if (!_collectionButton) {
        _collectionButton  = [IntegrationButton newAutoLayoutView];
        _collectionButton.btnLabel.font = MLFont1;
        _collectionButton.btnLabel.textColor = MLGrayColor;
        _collectionButton.spaceConstraints.constant = 2;
        
        MLWeakSelf;
        [_collectionButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(34);
            }
        }];
    }
    return _collectionButton;
}

- (UIButton *)orderButton {
    if (!_orderButton) {
        _orderButton = [UIButton newAutoLayoutView];
        [_orderButton setTitleColor:MLWhiteColor forState:0];
        [_orderButton setTitle:@"立即租用" forState:0];
        _orderButton.titleLabel.font = MLFont5;
        _orderButton.backgroundColor = MLOrangeColor;
        
        MLWeakSelf;
        [_orderButton addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(35);
            }
        }];
    }
    return _orderButton;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
