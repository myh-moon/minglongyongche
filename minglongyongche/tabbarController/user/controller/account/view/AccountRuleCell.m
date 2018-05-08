//
//  AccountRuleCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AccountRuleCell.h"

@implementation AccountRuleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.ruleButton1];
    [self.contentView addSubview:self.ruleButton2];
    [self.contentView addSubview:self.ruleButton3];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.ruleButton1,self.ruleButton2,self.ruleButton3];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:bigSpacing];
        [views autoMatchViewsDimension:ALDimensionHeight];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:bigSpacing];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)ruleButton1 {
    if (!_ruleButton1) {
        _ruleButton1 = [UIButton newAutoLayoutView];
        _ruleButton1.layer.borderColor = MLLightGrayColor.CGColor;
        _ruleButton1.layer.borderWidth = 1;
        _ruleButton1.titleLabel.numberOfLines = 0;
        _ruleButton1.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_ruleButton1 setAttributedTitle:[NSString setFirstPart:@"充500\n" firstFont:14 firstColor:MLLightGrayColor secondPart:@"送30" secondFont:10 secongColor:MLLightGrayColor] forState:0];
    }
    return _ruleButton1;
}

- (UIButton *)ruleButton2 {
    if (!_ruleButton2) {
        _ruleButton2 = [UIButton newAutoLayoutView];
        _ruleButton2.layer.borderColor = MLLightGrayColor.CGColor;
        _ruleButton2.layer.borderWidth = 1;
        _ruleButton2.titleLabel.numberOfLines = 0;
        _ruleButton2.titleLabel.textAlignment = NSTextAlignmentCenter;
         [_ruleButton2 setAttributedTitle:[NSString setFirstPart:@"充500\n" firstFont:14 firstColor:MLLightGrayColor secondPart:@"送30" secondFont:10 secongColor:MLLightGrayColor] forState:0];
    }
    return _ruleButton2;
}

- (UIButton *)ruleButton3 {
    if (!_ruleButton3) {
        _ruleButton3 = [UIButton newAutoLayoutView];
        _ruleButton3.layer.borderColor = MLLightGrayColor.CGColor;
        _ruleButton3.layer.borderWidth = 1;
        _ruleButton3.titleLabel.numberOfLines = 0;
        _ruleButton3.titleLabel.textAlignment = NSTextAlignmentCenter;
         [_ruleButton3 setAttributedTitle:[NSString setFirstPart:@"充500\n" firstFont:14 firstColor:MLLightGrayColor secondPart:@"送30" secondFont:10 secongColor:MLLightGrayColor] forState:0];
    }
    return _ruleButton3;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
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
