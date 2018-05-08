//
//  TimeButton.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "TimeButton.h"

@implementation TimeButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = MLRedColor;
        
        [self addSubview:self.dateLabel];
        [self addSubview:self.dateBtn];
        [self addSubview:self.priceLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.dateLabel,self.dateBtn,self.priceLabel];
        [views autoAlignViewsToAxis:ALAxisVertical];
        
        [self.dateLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self withOffset:10];
        [self.dateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        [self.dateLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        

        [self.dateBtn autoSetDimensionsToSize:CGSizeMake(40, 40)];
        [self.dateBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.dateLabel withOffset:10];
//        [self.dateBtn autoSetDimension:ALDimensionHeight toSize:(self.frame.size.height-10*2)];
//        [self.dateBtn autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.dateBtn];
        
        [self.priceLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.dateLabel];
        [self.priceLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.dateBtn withOffset:10];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [UILabel newAutoLayoutView];
        _dateLabel.textColor = MLLightGrayColor;
        _dateLabel.font = MLFont3;
        _dateLabel.text = @"一";
        _dateLabel.textAlignment = NSTextAlignmentCenter;
        _dateLabel.backgroundColor = MLBlueColor;
    }
    return _dateLabel;
}

- (UIButton *)dateBtn {
    if (!_dateBtn) {
        _dateBtn = [UIButton newAutoLayoutView];
        [_dateBtn setTitleColor:MLGrayColor forState:0];
        _dateBtn.titleLabel.font = MLFont3;
        [_dateBtn setTitle:@"今天" forState:0];
        _dateBtn.userInteractionEnabled = NO;
        _dateBtn.backgroundColor = MLBlueColor;
        _dateBtn.layer.cornerRadius = 20;
//        _dateBtn.layer.cornerRadius = (self.frame.size.width-10*2)/2;
    }
    return _dateBtn;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel newAutoLayoutView];
        _priceLabel.textColor = MLLightGrayColor;
        _priceLabel.font = MLFont3;
        _priceLabel.text = @"200/天";
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.backgroundColor = MLBlueColor;
    }
    return _priceLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
