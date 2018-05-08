//
//  OldDetailTextCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OldDetailTextCell.h"

@implementation OldDetailTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.costButton];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.taxationLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
        
        [self.costButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.nameLabel];
        [self.costButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        [self.priceLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
        [self.priceLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:middleSpacing];
        
        [self.taxationLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.priceLabel];
        [self.taxationLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.priceLabel withOffset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.font = MLFont;
        _nameLabel.textColor = MLBlackColor;
    }
    return _nameLabel;
}

- (UIButton *)costButton {
    if (!_costButton) {
        _costButton = [UIButton newAutoLayoutView];
        [_costButton setTitleColor:MLWhiteColor forState:0];
        _costButton.backgroundColor = MLLightGrayColor;
        _costButton.titleLabel.font = MLFont1;
    }
    return _costButton;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel newAutoLayoutView];
        _priceLabel.textColor = MLBlueColor;
        _priceLabel.font = MLFont;
    }
    return _priceLabel;
}

- (UILabel *)taxationLabel {
    if (!_taxationLabel) {
        _taxationLabel = [UILabel newAutoLayoutView];
        _taxationLabel.textColor = MLLightGrayColor;
        _taxationLabel.font = MLFont1;
    }
    return _taxationLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.nameLabel.text = @"奔驰豪华型";
    [self.costButton setTitle:@"0过户费" forState:0];
    self.priceLabel.text = @"12.00";
    self.taxationLabel.text = @"新车含税价";
    
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
