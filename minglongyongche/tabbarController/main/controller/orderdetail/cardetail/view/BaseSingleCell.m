//
//  BaseSingleCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseSingleCell.h"

@implementation BaseSingleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.singleButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.singleButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.singleButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)singleButton {
    if (!_singleButton) {
        _singleButton = [UIButton newAutoLayoutView];
        [_singleButton setTitleColor:MLBlackColor forState:0];
        _singleButton.titleLabel.font = MLFont;
    }
    return _singleButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.singleButton setTitle:self.item.firstTitleString forState:0];
    [self.singleButton setImage:[UIImage imageNamed:self.item.titleImageString] forState:0];
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
