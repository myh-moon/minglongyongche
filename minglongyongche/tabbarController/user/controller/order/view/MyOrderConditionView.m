//
//  MyOrderConditionView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderConditionView.h"

@implementation MyOrderConditionView

- (instancetype)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    if (self) {
        
        CALayer *bottom = [CALayer layer];
        bottom.backgroundColor = MLLightGrayColor.CGColor;
        bottom.frame = CGRectMake(0, 49,[UIScreen mainScreen].bounds.size.width , 1);
        
        [self.layer addSublayer:bottom];
        
        [self addSubview:self.firstButton];
        [self addSubview:self.secondButton];
        [self addSubview:self.thirdButton];
        [self addSubview:self.fourthButton];
        
        [self addSubview:self.slideLabel];
        
        self.leftConstarints =  [self.slideLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(MLWindowWidth/4 - 40)/2];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.firstButton,self.secondButton,self.thirdButton,self.fourthButton];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0];
        [views autoMatchViewsDimension:ALDimensionHeight];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        [self.slideLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self withOffset:-2];
        [self.slideLabel autoSetDimensionsToSize:CGSizeMake(40, 2)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

#pragma mark - getter
- (UIButton *)firstButton {
    if (!_firstButton) {
        _firstButton = [UIButton newAutoLayoutView];
        _firstButton.titleLabel.font = MLFont;
        [_firstButton setTitle:@"全部" forState:0];
        [_firstButton setTitleColor:MLOrangeColor forState:0];
        
        MLWeakSelf;
        [_firstButton addAction:^(UIButton *btn) {
            [btn setTitleColor:MLOrangeColor forState:0];
            [weakself.secondButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.thirdButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.fourthButton setTitleColor:MLLightGrayColor forState:0];

            weakself.leftConstarints.constant = (MLWindowWidth/4-40)/2;
            
            if (weakself.didChooseBtn) {
                weakself.didChooseBtn(445);
            }
            
        }];
    }
    return _firstButton;
}

- (UIButton *)secondButton {
    if (!_secondButton) {
        _secondButton = [UIButton newAutoLayoutView];
        _secondButton.titleLabel.font = MLFont;
        [_secondButton setTitle:@"未付款" forState:0];
        [_secondButton setTitleColor:MLLightGrayColor forState:0];
        
        MLWeakSelf;
        [_secondButton addAction:^(UIButton *btn) {
            [btn setTitleColor:MLOrangeColor forState:0];
            [weakself.firstButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.thirdButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.fourthButton setTitleColor:MLLightGrayColor forState:0];

            weakself.leftConstarints.constant = MLWindowWidth/4 + (MLWindowWidth/4-40)/2;
            
            if (weakself.didChooseBtn) {
                weakself.didChooseBtn(446);
            }
            
        }];
    }
    return _secondButton;
}

- (UIButton *)thirdButton {
    if (!_thirdButton) {
        _thirdButton = [UIButton newAutoLayoutView];
        _thirdButton.titleLabel.font = MLFont;
        [_thirdButton setTitle:@"进行中" forState:0];
        [_thirdButton setTitleColor:MLLightGrayColor forState:0];
        
        MLWeakSelf;
        [_thirdButton addAction:^(UIButton *btn) {
            [btn setTitleColor:MLOrangeColor forState:0];
            [weakself.firstButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.secondButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.fourthButton setTitleColor:MLLightGrayColor forState:0];

            weakself.leftConstarints.constant = MLWindowWidth/4*2 + (MLWindowWidth/4-40)/2;
            
            if (weakself.didChooseBtn) {
                weakself.didChooseBtn(447);
            }
            
        }];
    }
    return _thirdButton;
}



- (UIButton *)fourthButton {
    if (!_fourthButton) {
        _fourthButton = [UIButton newAutoLayoutView];
        _fourthButton.titleLabel.font = MLFont;
        [_fourthButton setTitle:@"已完成" forState:0];
        [_fourthButton setTitleColor:MLLightGrayColor forState:0];
        
        MLWeakSelf;
        [_fourthButton addAction:^(UIButton *btn) {
            [btn setTitleColor:MLOrangeColor forState:0];
            [weakself.firstButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.secondButton setTitleColor:MLLightGrayColor forState:0];
            [weakself.thirdButton setTitleColor:MLLightGrayColor forState:0];

            weakself.leftConstarints.constant = MLWindowWidth/4*3 + (MLWindowWidth/4-40)/2;
            
            if (weakself.didChooseBtn) {
                weakself.didChooseBtn(448);
            }
            
        }];
    }
    return _fourthButton;
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
