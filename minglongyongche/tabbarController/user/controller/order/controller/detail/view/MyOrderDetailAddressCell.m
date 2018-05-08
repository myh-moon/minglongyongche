//
//  MyOrderDetailAddressCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailAddressCell.h"

@implementation MyOrderDetailAddressCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.infoLabel];
    [self.contentView addSubview:self.addressButton];
    [self.contentView addSubview:self.addressLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.infoLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.infoLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:bigSpacing];
        
        [self.addressButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.infoLabel];
        [self.addressButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.infoLabel withOffset:middleSpacing];
        
        [self.addressLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.addressButton];
        [self.addressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.addressButton withOffset:smallSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel newAutoLayoutView];
        _infoLabel.text = @"取还车地点";
        _infoLabel.textColor = MLDrakGrayColor;
        _infoLabel.font = MLFont;
    }
    return _infoLabel;
}

- (UIButton *)addressButton {
    if (!_addressButton) {
        _addressButton = [UIButton newAutoLayoutView];
        [_addressButton setTitle:@"鸣垄名车会   " forState:0];
        [_addressButton setTitleColor:MLDrakGrayColor forState:0];
        _addressButton.titleLabel.font = MLFont;
        [_addressButton swapImage];
        [_addressButton setImage:[UIImage imageNamed:@"location"] forState:0];
    }
    return _addressButton;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel newAutoLayoutView];
        _addressLabel.textColor = MLLightGrayColor;
        _addressLabel.font = MLFont8;
    }
    return _addressLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.addressLabel.text = self.item.qcaddress;
    
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
