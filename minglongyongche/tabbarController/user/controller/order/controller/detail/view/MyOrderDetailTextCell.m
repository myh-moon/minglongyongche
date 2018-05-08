//
//  MyOrderDetailTextCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailTextCell.h"

@implementation MyOrderDetailTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 130;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.orderImage];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.licenseLabel];
    [self.contentView addSubview:self.featureLabel1];
    [self.contentView addSubview:self.featureLabel2];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.orderImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.orderImage autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:middleSpacing];
        [self.orderImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
        [self.orderImage autoSetDimension:ALDimensionWidth toSize:100];
        
        [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.orderImage withOffset:bigSpacing];
        [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.orderImage];
        
        [self.licenseLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
        [self.licenseLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:smallSpacing];
        
        [self.featureLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.licenseLabel];
        [self.featureLabel1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.orderImage];
        
        [self.featureLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.featureLabel1];
        [self.featureLabel2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.featureLabel1 withOffset:middleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIImageView *)orderImage {
    if (!_orderImage) {
        _orderImage = [UIImageView newAutoLayoutView];
        _orderImage.layer.borderColor = [UIColor colorWithRed:0.9647 green:0.9647 blue:0.9647 alpha:1].CGColor;
        _orderImage.layer.borderWidth = 1;
    }
    return _orderImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
        _nameLabel.textColor = MLBlackColor;
        _nameLabel.font = MLFont5;
    }
    return _nameLabel;
}

- (UILabel *)licenseLabel {
    if (!_licenseLabel) {
        _licenseLabel = [UILabel newAutoLayoutView];
        _licenseLabel.textColor = MLLightGrayColor;
        _licenseLabel.font = MLFont3;
    }
    return _licenseLabel;
}

- (UILabel *)featureLabel1 {
    if (!_featureLabel1) {
        _featureLabel1 = [UILabel newAutoLayoutView];
        _featureLabel1.textColor = MLLightGrayColor;
        _featureLabel1.font = MLFont3;
    }
    return _featureLabel1;
}

- (UILabel *)featureLabel2 {
    if (!_featureLabel2) {
        _featureLabel2 = [UILabel newAutoLayoutView];
        _featureLabel2.textColor = MLLightGrayColor;
        _featureLabel2.font = MLFont3;
    }
    return _featureLabel2;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.orderImage sd_setImageWithURL:[NSURL URLWithString:self.item.img]];
    self.nameLabel.text = self.item.name;
    self.licenseLabel.text  = self.item.license;
    self.featureLabel1.text = self.item.feature1;
    self.featureLabel2.text = self.item.feature2;
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
