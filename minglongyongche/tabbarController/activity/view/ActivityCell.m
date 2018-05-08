//
//  ActivityCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 190;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.contentView.backgroundColor = MLLightGrayColor;
    
    [self.contentView addSubview:self.activityBannerButton];
    [self.contentView addSubview:self.activityNameLabel];
    [self.contentView addSubview:self.lookedButton];
    [self.contentView addSubview:self.statusButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.activityBannerButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        [self.activityBannerButton autoSetDimension:ALDimensionHeight toSize:120];
        
        
        [self.activityNameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [self.activityNameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.activityBannerButton withOffset:smallSpacing];
        
        [self.lookedButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.activityNameLabel];
        [self.lookedButton autoPinEdge: ALEdgeTop toEdge:ALEdgeBottom ofView:self.activityNameLabel];
        
        [self.statusButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.lookedButton];
        [self.statusButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
    }
    [super updateConstraints];
}

#pragma mark - getter
- (UIButton *)activityBannerButton {
    if (!_activityBannerButton) {
        _activityBannerButton = [UIButton newAutoLayoutView];
        _activityBannerButton.backgroundColor = MLRedColor;
        _activityBannerButton.userInteractionEnabled = NO;
    }
    return _activityBannerButton;
}

- (UILabel *)activityNameLabel {
    if (!_activityNameLabel) {
        _activityNameLabel = [UILabel newAutoLayoutView];
        _activityNameLabel.textColor = MLBlackColor;
        _activityNameLabel.font = MLFont;
    }
    return _activityNameLabel;
}

- (UIButton *)lookedButton {
    if (!_lookedButton) {
        _lookedButton = [UIButton newAutoLayoutView];
        _lookedButton.titleLabel.font = MLFont1;
        [_lookedButton setTitleColor:MLWhiteColor forState:0];
    }
    return _lookedButton;
}

- (UIButton *)statusButton {
    if (!_statusButton) {
        _statusButton = [UIButton newAutoLayoutView];
        _statusButton.backgroundColor = MLDrakGrayColor;
        [_statusButton setTitleColor:MLWhiteColor forState:0];
        _statusButton.titleLabel.font = MLFont1;
    }
    return _statusButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.activityBannerButton setTitle:@"banner图片" forState:0];
    self.activityNameLabel.text = @"一锤定音活动";
    [self.lookedButton setTitle:@"100次" forState:0];
    [self.statusButton setTitle:@"正在进行中" forState:0];
    
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
