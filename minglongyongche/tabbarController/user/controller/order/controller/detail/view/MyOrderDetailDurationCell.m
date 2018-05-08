//
//  MyOrderDetailDurationCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailDurationCell.h"

@implementation MyOrderDetailDurationCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.startLabel];
    [self.contentView addSubview:self.endLabel];
    [self.contentView addSubview: self.durationImageView];
    [self.contentView addSubview:self.durationLabel];
    
    [self setNeedsUpdateConstraints];
}
- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.startLabel,self.durationLabel,self.endLabel,self.durationImageView];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.startLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.startLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.endLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        
        [self.durationImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.durationLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)startLabel {
    if (!_startLabel) {
        _startLabel = [UILabel newAutoLayoutView];
        _startLabel.textColor = MLDrakGrayColor;
        _startLabel.font = MLFont;
        _startLabel.numberOfLines = 0;
        _startLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _startLabel;
}

- (UILabel *)endLabel {
    if (!_endLabel) {
        _endLabel = [UILabel newAutoLayoutView];
        _endLabel.textColor = MLDrakGrayColor;
        _endLabel.font = MLFont;
        _endLabel.numberOfLines = 0;
        _endLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _endLabel;
}

- (UIImageView *)durationImageView {
    if (!_durationImageView) {
        _durationImageView = [UIImageView newAutoLayoutView];
        [_durationImageView setImage:[UIImage imageNamed:@"arrow_time_between"]];
    }
    return _durationImageView;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
        _durationLabel.textColor = MLOrangeColor;
        _durationLabel.font = MLFont8;
        _durationLabel.numberOfLines = 0;
    }
    return _durationLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.startLabel.text = self.item.starttime;
    self.endLabel.text = self.item.endtime;
    self.durationLabel.attributedText =  [NSString setFirstPart:self.item.duration firstFont:13 firstColor:MLOrangeColor secondPart:@"\n租期" secondFont:13 secongColor:MLOrangeColor space:4 align:1];
    
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
