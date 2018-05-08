
//
//  MyOrderDetailBaseCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailBaseCell.h"

@implementation MyOrderDetailBaseCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.sssLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        [self.sssLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.sssLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:bigSpacing];

        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)sssLabel {
    if (!_sssLabel) {
        _sssLabel = [UILabel newAutoLayoutView];
        _sssLabel.text = @"订单详情：";
        _sssLabel.textColor = MLBlackColor;
        _sssLabel.font = MLFont4;
    }
    return _sssLabel;
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
