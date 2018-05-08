//
//  CarListCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/30.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarListCell.h"


@implementation CarListCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 150;
}

- (void)cellDidLoad {
    
    [super cellDidLoad];
    
    self.contentView.backgroundColor = MLBackGroundColor;
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.carNameLabel];
    [self.contentView addSubview:self.carLicenseLabel];
    [self.contentView addSubview:self.qualityButton];
    [self.contentView addSubview:self.carPriceLabel];
    [self.contentView addSubview:self.carUsedLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 0, 10)];
    
//        [self.carImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 24, 20, 0) excludingEdge:ALEdgeRight];
//        [self.carImageView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.carImageView];
        [self.carImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.backView withOffset:smallSpacing];
        [self.carImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.backView withOffset:smallSpacing];
        [self.carImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.backView withOffset:-smallSpacing];
        [self.carImageView autoSetDimension:ALDimensionWidth toSize:150];
        
        [self.carNameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.carImageView withOffset:middleSpacing];
        [self.carNameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.carImageView withOffset:4];
        [self.carNameLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.backView withOffset:-smallSpacing];
        
        [self.carLicenseLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.carNameLabel];
        [self.carLicenseLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carNameLabel withOffset:5];
        
        
        [self.qualityButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.carLicenseLabel];
        [self.qualityButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carLicenseLabel withOffset:smallSpacing];
        [self.qualityButton autoSetDimensionsToSize:CGSizeMake(60, 20)];
        
        [self.carPriceLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.carNameLabel];
        [self.carPriceLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.carImageView withOffset:-4];
        
        [self.carUsedLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.carNameLabel];
        [self.carUsedLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.carPriceLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

#pragma mark - getter

- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView newAutoLayoutView];
        _backView.backgroundColor =  MLWhiteColor;
    }
    return _backView;
}
- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
    }
    return _carImageView;
}

- (UILabel *)carNameLabel {
    if (!_carNameLabel) {
        _carNameLabel = [UILabel newAutoLayoutView];
        _carNameLabel.textColor = MLBlackColor;
        _carNameLabel.font = MLFont4;
    }
    return _carNameLabel;
}

- (UILabel *)carLicenseLabel {
    if (!_carLicenseLabel) {
        _carLicenseLabel = [UILabel newAutoLayoutView];
        _carLicenseLabel.textColor =MLGrayColor;
        _carLicenseLabel.font = MLFont3;
    }
    return _carLicenseLabel;
}

- (UIButton *)qualityButton {
    if (!_qualityButton) {
        _qualityButton = [UIButton newAutoLayoutView];
        _qualityButton.backgroundColor = MLBackGroundColor;
        [_qualityButton setTitleColor:MLGrayColor forState:0];
        _qualityButton.titleLabel.font = MLFont1;
    }
    return _qualityButton;
}

- (UILabel *)carPriceLabel {
    if (!_carPriceLabel) {
        _carPriceLabel = [UILabel newAutoLayoutView];
        _carPriceLabel.textColor = MLOrangeColor;
        _carPriceLabel.font = MLFont;
    }
    return _carPriceLabel;
}

- (UILabel *)carUsedLabel {
    if (!_carUsedLabel) {
        _carUsedLabel = [UILabel newAutoLayoutView];
        _carUsedLabel.textColor = MLGrayColor;
        _carUsedLabel.font = MLFont1;
    }
    return _carUsedLabel;
}
#pragma mark - end

- (void)cellWillAppear {
    
    [super cellWillAppear];
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self.carImageView sd_setImageWithURL:[NSURL URLWithString:self.item.imageName]];
    
    self.carNameLabel.text = self.item.carName;
    self.carLicenseLabel.text = self.item.carLicense;
    [self.qualityButton setTitle:@"  精选优车  " forState:0];
    self.carUsedLabel.text = self.item.carUsedDay;
    [self.carPriceLabel setAttributedText:[NSString setFirstPart:@"日租¥" firstFont:11 firstColor:MLOrangeColor secondPart:self.item.carPrice secondFont:18 secongColor:MLOrangeColor thirdPart:@"/天" thirdFont:11 thirdColor:MLOrangeColor]];
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
