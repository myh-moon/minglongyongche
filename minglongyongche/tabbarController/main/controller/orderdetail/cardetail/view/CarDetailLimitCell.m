//
//  CarDetailLimitCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarDetailLimitCell.h"

@implementation CarDetailLimitCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 130;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.limitLabel];
    [self.contentView addSubview:self.firstButton1];
    [self.contentView addSubview:self.firstButton2];
    [self.contentView addSubview:self.firstButton3];
    [self.contentView addSubview:self.firstButton4];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.limitLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.limitLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
        
        NSArray *views = @[self.firstButton1,self.firstButton2,self.firstButton3,self.firstButton4];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:smallSpacing];
        
        [views autoMatchViewsDimension:ALDimensionHeight];
        
        [[views firstObject] autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.limitLabel];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:middleSpacing];
        [[views firstObject] autoSetDimension:ALDimensionHeight toSize:65];
        
        [[views lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)limitLabel {
    if (!_limitLabel) {
        _limitLabel = [UILabel newAutoLayoutView];
        _limitLabel.textColor = MLBlackColor;
        _limitLabel.font = MLFont4;
        _limitLabel.text = @"用车限制";
    }
    return _limitLabel;
}

- (UIButton *)firstButton1 {
    if (!_firstButton1) {
        _firstButton1 = [UIButton newAutoLayoutView];
        _firstButton1.titleLabel.numberOfLines = 0;
        _firstButton1.titleLabel.textAlignment = NSTextAlignmentCenter;
        _firstButton1.layer.borderColor = MLLightGrayColor.CGColor;
        _firstButton1.layer.borderWidth = 0.4;
        
//        CALayer *layer = [_firstButton1 layer];
//        layer.shadowColor = MLBlackColor.CGColor;
//        layer.shadowOffset = CGSizeMake(0, 20);
//        layer.shadowRadius = 0.5;

        
//        CALayer *laler = [_firstButton1 layer];
//        laler.shadowColor = MLBlackColor.CGColor;
//        laler.shadowOffset = CGSizeMake(0, 10);
//        laler.shadowOpacity = 0.5;
    }
    return _firstButton1;
}

- (UIButton *)firstButton2 {
    if (!_firstButton2) {
        _firstButton2 = [UIButton newAutoLayoutView];
        _firstButton2.titleLabel.numberOfLines = 0;
        _firstButton2.titleLabel.textAlignment = NSTextAlignmentCenter;
        _firstButton2.layer.borderColor = MLLightGrayColor.CGColor;
        _firstButton2.layer.borderWidth = 0.4;
    }
    return _firstButton2;
}

- (UIButton *)firstButton3 {
    if (!_firstButton3) {
        _firstButton3 = [UIButton newAutoLayoutView];
        _firstButton3.titleLabel.numberOfLines = 0;
        _firstButton3.titleLabel.textAlignment = NSTextAlignmentCenter;
        _firstButton3.layer.borderColor = MLLightGrayColor.CGColor;
        _firstButton3.layer.borderWidth = 0.4;
    }
    return _firstButton3;
}

- (UIButton *)firstButton4 {
    if (!_firstButton4) {
        _firstButton4 = [UIButton newAutoLayoutView];
        _firstButton4.titleLabel.numberOfLines = 0;
        _firstButton4.titleLabel.textAlignment = NSTextAlignmentCenter;
        _firstButton4.layer.borderColor = MLLightGrayColor.CGColor;
        _firstButton4.layer.borderWidth = 0.4;
    }
    return _firstButton4;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.firstButton1 setAttributedTitle:[NSString setFirstPart:@"1-2小时\n" firstFont:12 firstColor:MLDrakGrayColor secondPart:@"提前预定" secondFont:11 secongColor:MLLightGrayColor space:6 align:1] forState:0];
   
    [self.firstButton2 setAttributedTitle:[NSString setFirstPart:@"1天起租\n" firstFont:12 firstColor:MLDrakGrayColor secondPart:@"租期要求" secondFont:11 secongColor:MLLightGrayColor space:6 align:1] forState:0];

    [self.firstButton3 setAttributedTitle:[NSString setFirstPart:@"300km\n" firstFont:12 firstColor:MLDrakGrayColor secondPart:@"日均限行" secondFont:11 secongColor:MLLightGrayColor space:6 align:1] forState:0];

    [self.firstButton4 setAttributedTitle:[NSString setFirstPart:@"22:00-9:00\n" firstFont:12 firstColor:MLDrakGrayColor secondPart:@"不能还车" secondFont:11 secongColor:MLLightGrayColor space:6 align:1] forState:0];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
