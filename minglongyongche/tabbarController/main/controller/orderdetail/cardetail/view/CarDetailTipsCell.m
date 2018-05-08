//
//  CarDetailTipsCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarDetailTipsCell.h"

@implementation CarDetailTipsCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
        
        [self.detailLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel];
        [self.detailLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:middleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = MLBlackColor;
        _titleLabel.text = @"取车须知";
        _titleLabel.font = MLFont4;
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [UILabel newAutoLayoutView];
        _detailLabel.numberOfLines = 0;
        
//        _detailLabel.text = @"1、请携带本人有效身份证+驾驶证+信用卡；\n2、取车前需要刷取3000元预授权或押金";
//        _detailLabel.font = MLFont3;
//        _detailLabel.textColor = MLGrayColor;
        
        [_detailLabel setAttributedText: [NSString setFirstPart:@"1、请携带本人有效身份证+驾驶证+信用卡；\n" firstFont:12 firstColor:MLGrayColor secondPart:@"2、取车前需要刷取3000元预授权或押金。" secondFont:12 secongColor:MLGrayColor space:10 align:0]];
        
    }
    return _detailLabel;
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
