//
//  WeddingListCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "WeddingListCell.h"

@implementation WeddingListCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    
    [super cellDidLoad];
    
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.carNameLabel];
    [self.contentView addSubview:self.carColorLabel];
    [self.contentView addSubview:self.typeButton];
    [self.contentView addSubview:self.carPriceLabel];
    [self.contentView addSubview:self.carUsedLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        
        [self.carImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 24, 20, 0) excludingEdge:ALEdgeRight];
        [self.carImageView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.carImageView];
        
        [self.carNameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.carImageView withOffset:20];
        [self.carNameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.carImageView withOffset:4];
        
        [self.carColorLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.carNameLabel];
        [self.carColorLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carNameLabel withOffset:10];
        
        [self.typeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.carNameLabel];
        [self.typeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        
        [self.carPriceLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.carNameLabel];
        [self.carPriceLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.carImageView withOffset:-4];
        
        [self.carUsedLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
        [self.carUsedLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.carPriceLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

#pragma mark - getter

- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView newAutoLayoutView];
        _backView.backgroundColor =  [UIColor colorWithRed:0.9294 green:0.9255 blue:0.9294 alpha:1];
        _backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _backView.layer.borderWidth = 1;
    }
    return _backView;
}
- (UIImageView *)carImageView {
    if (!_carImageView) {
        _carImageView = [UIImageView newAutoLayoutView];
        _carImageView.backgroundColor = [UIColor redColor];
        _carImageView.layer.cornerRadius = 10;
    }
    return _carImageView;
}

- (UILabel *)carNameLabel {
    if (!_carNameLabel) {
        _carNameLabel = [UILabel newAutoLayoutView];
        _carNameLabel.textColor = MLBlueColor;
        _carNameLabel.font = MLFont;
    }
    return _carNameLabel;
}

- (UILabel *)carColorLabel {
    if (!_carColorLabel) {
        _carColorLabel = [UILabel newAutoLayoutView];
        _carColorLabel.textColor =MLBlueColor;
        _carColorLabel.font = MLFont;
    }
    return _carColorLabel;
}

- (UILabel *)carPriceLabel {
    if (!_carPriceLabel) {
        _carPriceLabel = [UILabel newAutoLayoutView];
        _carPriceLabel.textColor = MLBlueColor;
        _carPriceLabel.font = MLFont;
    }
    return _carPriceLabel;
}

- (UIButton *)typeButton {
    if (!_typeButton) {
        _typeButton = [UIButton newAutoLayoutView];
        _typeButton.backgroundColor = MLGrayColor;
        _typeButton.layer.borderColor = MLDrakGrayColor.CGColor;
        _typeButton.layer.borderWidth = 1;
        [_typeButton setTitleColor:MLWhiteColor forState:0];
        _typeButton.titleLabel.font = MLFont1;
    }
    return _typeButton;
}

- (UILabel *)carUsedLabel {
    if (!_carUsedLabel) {
        _carUsedLabel = [UILabel newAutoLayoutView];
        _carUsedLabel.textColor = MLBlueColor;
        _carUsedLabel.font = MLFont;
    }
    return _carUsedLabel;
}
#pragma mark - end

- (void)cellWillAppear {
    
    [super cellWillAppear];
    
    self.backgroundColor = [UIColor whiteColor];
    
//    [self.carImageView sd_setImageWithURL:[NSURL URLWithString:self.item.imageName]];
//
//    self.carNameLabel.text = self.item.carName;
//    self.carColorLabel.text = self.item.carLicense;
//    self.carPriceLabel.text = self.item.carPrice;
//    self.carUsedLabel.text = self.item.carUsedDay;
    
    self.carNameLabel.text = @"豪车超";
    self.carColorLabel.text = @"颜色：金色";
    [self.typeButton setTitle:@"主推荐" forState:0];
    self.carPriceLabel.text = @"2000元起";
    self.carUsedLabel.text = @"2000公里/小时";
    
}

- (void)cellDidDisappear {
    
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
