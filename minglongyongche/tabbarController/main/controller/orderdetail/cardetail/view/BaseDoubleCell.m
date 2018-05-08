//
//  BaseDoubleCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/17.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseDoubleCell.h"

@implementation BaseDoubleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.firstButton];
    [self.contentView addSubview:self.secondButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.firstButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [self.firstButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.secondButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.firstButton];
        [self.secondButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)firstButton {
    if (!_firstButton) {
        _firstButton = [UIButton newAutoLayoutView];
        _firstButton.titleLabel.font = MLFont;
        [_firstButton setTitleColor:MLBlackColor forState:0];
    }
    return _firstButton;
}

- (UIButton *)secondButton {
    if (!_secondButton) {
        _secondButton = [UIButton newAutoLayoutView];
        _secondButton.titleLabel.font = MLFont;
        [_secondButton setTitleColor:MLBlackColor forState:0];
        [_secondButton swapImage];
        [_secondButton setImage:[UIImage imageNamed:@"arrow_right"] forState:0];
    }
    return _secondButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.firstButton setImage:[UIImage imageNamed:self.item.titleImageString] forState:0];
    
    [self.firstButton setTitle:self.item.firstTitleString forState:0];
    
    [self.secondButton setTitle:self.item.secondTextString forState:0];
    
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
