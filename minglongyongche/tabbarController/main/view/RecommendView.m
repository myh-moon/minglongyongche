//
//  RecommendView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/18.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "RecommendView.h"

@implementation RecommendView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.imgBtn];
        [self addSubview:self.xxLabel];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.imgBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.imgBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.xxLabel];
        
        [self.xxLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.xxLabel autoSetDimension:ALDimensionHeight toSize:40];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)imgBtn {
    if (!_imgBtn) {
        _imgBtn = [UIButton newAutoLayoutView];
        _imgBtn.backgroundColor = MLWhiteColor;
//        _imgBtn.layer.borderColor = MLRedColor.CGColor;
//        _imgBtn.layer.borderWidth = 1;
        
        CALayer *layer = [_imgBtn layer];
        layer.shadowOffset = CGSizeMake(0, 2);
        layer.shadowColor = MLGrayColor.CGColor;
        layer.shadowOpacity = 0.8;
    }
    return _imgBtn;
}

- (UILabel *)xxLabel {
    if (!_xxLabel) {
        _xxLabel = [UILabel newAutoLayoutView];
        _xxLabel.textColor = MLBlackColor;
        _xxLabel.font = MLFont3;
        _xxLabel.text = @"2016款福特推荐";
    }
    return _xxLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
