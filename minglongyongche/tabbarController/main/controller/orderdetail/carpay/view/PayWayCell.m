//
//  PayWayCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayWayCell.h"

@implementation PayWayCell

//+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return MLCellHeight;
//}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.redLabel];
    [self.contentView addSubview:self.wayLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.redLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.redLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.redLabel autoSetDimensionsToSize:CGSizeMake(4, 14)];
        
        [self.wayLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.redLabel withOffset:5];
        [self.wayLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.redLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)redLabel {
    if (!_redLabel) {
        _redLabel = [UILabel newAutoLayoutView];
        _redLabel.backgroundColor = MLOrangeColor;
    }
    return _redLabel;
}

-(UILabel *)wayLabel {
    if (!_wayLabel) {
        _wayLabel = [UILabel newAutoLayoutView];
//        _wayLabel.text = @"支付方式";
        _wayLabel.textColor = MLBlackColor;
        _wayLabel.font = MLFont;
    }
    return _wayLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
   
    self.wayLabel.text = self.item.firstTitleString;
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
