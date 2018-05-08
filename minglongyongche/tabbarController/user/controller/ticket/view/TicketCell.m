//
//  TicketCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "TicketCell.h"

@implementation TicketCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.noteLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(middleSpacing, middleSpacing, 0, middleSpacing)];

//        [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.backView withOffset:middleSpacing];
//        [self.nameLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.backView];
//
        
        [self.nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.backView withOffset:middleSpacing];
        [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.backView withOffset:middleSpacing];

        [self.noteLabel autoPinEdge:ALEdgeTop  toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:smallSpacing];
        [self.noteLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.nameLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView newAutoLayoutView];
        _backView.backgroundColor = MLBackGroundColor;
    }
    return _backView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel newAutoLayoutView];
//        _nameLabel.text = @"50元租车优惠券";
        _nameLabel.textColor = MLBlackColor;
        _nameLabel.font = MLFont2;
    }
    return _nameLabel;
}

- (UILabel *)noteLabel {
    if (!_noteLabel) {
        _noteLabel = [UILabel newAutoLayoutView];
//        _noteLabel.text = @"说明文档说明文档说明文档说明文档\n有效期有效期有效期\n说明文档";
//        _noteLabel.numberOfLines = 0;
        _noteLabel.font = MLFont3;
        _noteLabel.textColor = MLLightGrayColor;
    }
    return _noteLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.nameLabel.text = self.item.name;
    
    self.noteLabel.text = self.item.note;
    
//    if (self.item.isValid) {
//        self.backView.backgroundColor = [UIColor colorWithRed:0.9647 green:0.9647 blue:0.9647 alpha:1];
//    }else{
//        self.backView.backgroundColor = [UIColor colorWithRed:0.9647 green:0.9647 blue:0.9647 alpha:0.5];
//    }
    
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
