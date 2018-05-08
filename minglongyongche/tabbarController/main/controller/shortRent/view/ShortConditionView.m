//
//  ShortConditionView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ShortConditionView.h"

@implementation ShortConditionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = MLWhiteColor;
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 49, MLWindowWidth, 1);
        layer.backgroundColor = MLBackGroundColor.CGColor;
        [self.layer addSublayer:layer];
        
        [self addSubview:self.typeBtn];
        [self addSubview:self.rentBtn];
        [self addSubview:self.brandBtn];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.typeBtn,self.rentBtn,self.brandBtn];
        //        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:20 insetSpacing:YES matchedSizes:YES];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:20];
        [views autoSetViewsDimension:ALDimensionHeight toSize:50];
        
        [[views firstObject ] autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [[views lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

//- (UIButton *)comprehensiveBtn {
//    if (!_comprehensiveBtn) {
//        _comprehensiveBtn = [UIButton newAutoLayoutView];
//        [_comprehensiveBtn setTitle:@"综合排序^" forState:0];
//        [_comprehensiveBtn setTitleColor:[UIColor grayColor] forState:0];
//        _comprehensiveBtn.titleLabel.font = MLFont;
//        //        _comprehensiveBtn.backgroundColor = [UIColor redColor];
//        _comprehensiveBtn.contentHorizontalAlignment = 1;
//        
//        MLWeakSelf;
//        [_comprehensiveBtn addAction:^(UIButton *btn) {
//            if (weakself.didSelectedBtn) {
//                weakself.didSelectedBtn(111);
//            }
//        }];
//        
//    }
//    return _comprehensiveBtn;
//}

- (UIButton *)typeBtn {
    if (!_typeBtn) {
        _typeBtn = [UIButton newAutoLayoutView];
        [_typeBtn setTitle:@"类型  " forState:0];
        [_typeBtn setTitleColor:[UIColor grayColor] forState:0];
        _typeBtn.titleLabel.font = MLFont;
//        _typeBtn.contentHorizontalAlignment = 2;
        [_typeBtn swapImage];
        [_typeBtn setImage:[UIImage imageNamed:@"xiala"] forState:0];
        
        MLWeakSelf;
        [_typeBtn addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(112);
            }
        }];
    }
    return _typeBtn;
}

- (UIButton *)rentBtn {
    if (!_rentBtn) {
        _rentBtn = [UIButton newAutoLayoutView];
        [_rentBtn setTitle:@"租金  " forState:0];
        [_rentBtn setTitleColor:[UIColor grayColor] forState:0];
        _rentBtn.titleLabel.font = MLFont;
        [_rentBtn swapImage];
        [_rentBtn setImage:[UIImage imageNamed:@"xiala"] forState:0];

        
        MLWeakSelf;
        [_rentBtn addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(114);
            }
        }];
    }
    return _rentBtn;
}

- (UIButton *)brandBtn {
    if (!_brandBtn) {
        _brandBtn = [UIButton newAutoLayoutView];
        [_brandBtn setTitle:@"品牌  " forState:0];
        [_brandBtn setTitleColor:[UIColor grayColor] forState:0];
        _brandBtn.titleLabel.font = MLFont;
//        _brandBtn.contentHorizontalAlignment = 1;
        [_brandBtn swapImage];
        [_brandBtn setImage:[UIImage imageNamed:@"pinpai"] forState:0];

        MLWeakSelf;
        [_brandBtn addAction:^(UIButton *btn) {
            if (weakself.didSelectedBtn) {
                weakself.didSelectedBtn(113);
            }
        }];
        
    }
    return _brandBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
