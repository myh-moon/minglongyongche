//
//  OldCarListCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OldCarListCell.h"

@implementation OldCarListCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 170;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = UIEdgeInsetsMake(0, smallSpacing, 0, bigSpacing);
    
    [self.contentView addSubview:self.carImageButton];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.situationLabel];
    [self.contentView addSubview:self.statusLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.carImageButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(smallSpacing, bigSpacing, 0, bigSpacing) excludingEdge:ALEdgeBottom];
        [self.carImageButton autoSetDimension:ALDimensionHeight toSize:130];
        
        NSArray *views = @[self.priceLabel,self.situationLabel,self.statusLabel];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [[views firstObject] autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.carImageButton];
        [[views firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carImageButton withOffset:smallSpacing];
        
        [self.situationLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.priceLabel withOffset:bigSpacing];
        [self.statusLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.situationLabel withOffset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)carImageButton {
    if (!_carImageButton) {
        _carImageButton = [UIButton newAutoLayoutView];
        _carImageButton.layer.borderColor = MLGrayColor.CGColor;
        _carImageButton.layer.borderWidth = 1;
        _carImageButton.backgroundColor = MLLightGrayColor;
        _carImageButton.userInteractionEnabled = NO;
    }
    return _carImageButton;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel newAutoLayoutView];
        _priceLabel.textColor = MLBlueColor;
        _priceLabel.font = MLFont3;
    }
    return _priceLabel;
}

- (UILabel *)situationLabel {
    if (!_situationLabel) {
        _situationLabel = [UILabel newAutoLayoutView];
        _situationLabel.textColor = MLBlueColor;
        _situationLabel.font = MLFont3;
    }
    return _situationLabel;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel newAutoLayoutView];
        _statusLabel.textColor = MLBlueColor;
        _statusLabel.font = MLFont3;
    }
    return _statusLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.priceLabel.text = @"10.00万";
    self.situationLabel.text = @"0过户";
    self.statusLabel.text = @"急售";
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
