//
//  WeddingDetailTextCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "WeddingDetailTextCell.h"

@implementation WeddingDetailTextCell

@synthesize item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.colorButton];
    [self.contentView addSubview:self.styleLabel];
    [self.contentView addSubview:self.licenseLabel];
    [self.contentView addSubview:self.basePriceLabel];
    [self.contentView addSubview:self.presentPriceLabel];
    [self.contentView addSubview:self.typeButton];
    [self.contentView addSubview:self.speedLabel];
 
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupCoinstraints) {
        
        NSArray *views = @[self.nameLabel,self.colorButton,self.styleLabel,self.basePriceLabel];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:bigSpacing];
        [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        
        [self.colorButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nameLabel withOffset:smallSpacing];
        
        [self.styleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.colorButton withOffset:smallSpacing];
        
        [self.licenseLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
        [self.licenseLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:smallSpacing];
        
        [self.basePriceLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        [self.presentPriceLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.licenseLabel];
        [self.presentPriceLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.basePriceLabel];
        
        [self.typeButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.licenseLabel];
        [self.typeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.licenseLabel withOffset:bigSpacing];
        
        [self.speedLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.typeButton ];
        [self.speedLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.presentPriceLabel];
        
        self.didSetupCoinstraints = YES;
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

- (UIButton *)colorButton {
    if (!_colorButton) {
        _colorButton = [UIButton newAutoLayoutView];
        _colorButton.backgroundColor = MLLightGrayColor;
        [_colorButton setTitleColor:MLWhiteColor forState:0];
        _colorButton.titleLabel.font = MLFont3;
    }
    return _colorButton;
}

- (UILabel *)styleLabel {
    if (!_styleLabel) {
        _styleLabel  = [UILabel newAutoLayoutView];
        _styleLabel.textColor = MLLightGrayColor;
        _styleLabel.font = MLFont1;
    }
    return _styleLabel;
}

- (UILabel *)licenseLabel {
    if (!_licenseLabel) {
        _licenseLabel = [UILabel newAutoLayoutView];
        _licenseLabel.textColor = MLLightGrayColor;
        _licenseLabel.font = MLFont1;
    }
    return _licenseLabel;
}

- (UILabel *)basePriceLabel {
    if (!_basePriceLabel) {
        _basePriceLabel  = [UILabel  newAutoLayoutView];
        _basePriceLabel.textColor = MLBlueColor;
        _basePriceLabel.font= MLFont;
    }
    return _basePriceLabel;
}

- (UILabel *)presentPriceLabel {
    if (!_presentPriceLabel) {
        _presentPriceLabel  = [UILabel newAutoLayoutView];
        _presentPriceLabel.textColor = MLLightGrayColor;
        _presentPriceLabel.font = MLFont1;
    }
    return _presentPriceLabel;
}

- (UIButton *)typeButton {
    if (!_typeButton) {
        _typeButton  = [UIButton newAutoLayoutView];
        _typeButton.backgroundColor  =MLLightGrayColor;
        [_typeButton setTitleColor:MLWhiteColor forState:0];
        _typeButton.titleLabel.font = MLFont3;
    }
    return _typeButton;
}

- (UILabel *)speedLabel {
    if (!_speedLabel) {
        _speedLabel  = [UILabel newAutoLayoutView];
        _speedLabel.textColor = MLGrayColor;
        _speedLabel.font = MLFont3;
    }
    return _speedLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.nameLabel.text = @"奥迪奥迪";
    [self.colorButton setTitle:@"白" forState:0];
    self.styleLabel.text = @"精选精选";
    self.licenseLabel.text = @"沪牌";
    self.basePriceLabel.text = @"1000元起";
    self.presentPriceLabel.text = @"新车20万";
    [self.typeButton setTitle:@"自推荐" forState:0];
    self.speedLabel.text = @"2000公里每小时";
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
