//
//  MyOrderDetailNumberCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailNumberCell.h"

@implementation MyOrderDetailNumberCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.numberLabel1];
    [self.contentView addSubview:self.numberLabel2];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.numberLabel1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.numberLabel1 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.numberLabel2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        [self.numberLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.numberLabel1];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)numberLabel1 {
    if (!_numberLabel1) {
        _numberLabel1 = [UILabel newAutoLayoutView];
        _numberLabel1.textColor = MLLightGrayColor;
        _numberLabel1.font = MLFont;
    }
    return _numberLabel1;
}

- (UILabel *)numberLabel2 {
    if (!_numberLabel2) {
        _numberLabel2 = [UILabel newAutoLayoutView];
        _numberLabel2.textColor = MLLightGrayColor;
        _numberLabel2.font = MLFont;
    }
    return _numberLabel2;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.numberLabel1.text = self.item.info;
    self.numberLabel2.text = self.item.detail;
    
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
