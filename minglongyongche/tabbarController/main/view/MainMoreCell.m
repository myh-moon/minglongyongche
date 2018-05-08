//
//  MainMoreCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MainMoreCell.h"

@implementation MainMoreCell

@dynamic item;


+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.rightButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints{
    if (!self.didSetupConstraints) {
        
        [self.leftButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        
        [self.leftButton autoAlignAxisToSuperviewAxis: ALAxisHorizontal];
        
        [self.rightButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        [self.rightButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.leftButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton newAutoLayoutView];
        [_leftButton setTitleColor:MLBlackColor forState:0];
        _leftButton.titleLabel.font = MLFont4;
    }
    return _leftButton;
}

- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton newAutoLayoutView];
        [_rightButton setTitleColor:MLLightGrayColor forState:0];
        _rightButton.titleLabel.font = MLFont2;
    }
    return _rightButton;
}

- (void)cellWillAppear{
    [super cellWillAppear];
    
    [self.leftButton setTitle:@"精选优车" forState:0];
    
    [self.rightButton setTitle:@"更多>" forState:0];
    
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
