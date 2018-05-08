//
//  ConfirmTicketCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/28.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmTicketCell.h"

@implementation ConfirmTicketCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.ticketLabel];
    [self.contentView addSubview:self.ticketButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.ticketLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.ticketLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.ticketButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        [self.ticketButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.ticketLabel];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)ticketLabel {
    if (!_ticketLabel) {
        _ticketLabel = [UILabel newAutoLayoutView];
        _ticketLabel.textColor = MLDrakGrayColor;
        _ticketLabel.font = MLFont;
        _ticketLabel.text = @"优惠券";
    }
    return _ticketLabel;
}

- (UIButton *)ticketButton {
    if (!_ticketButton) {
        _ticketButton = [UIButton newAutoLayoutView];
        [_ticketButton swapImage];
        [_ticketButton setImage:[UIImage imageNamed:@"arrow_right"] forState:0];
        [_ticketButton setTitleColor:MLLightGrayColor forState:0];
        _ticketButton.titleLabel.font = MLFont;
        _ticketButton.userInteractionEnabled = NO;
        
        MLWeakSelf;
        [_ticketButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedText) {
                weakself.item.didSelectedText(btn);
            }
        }];
    }
    return _ticketButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    [self.ticketButton setTitle:self.item.secondTextString forState:0];
    
    [RACObserve(self.item, secondTextString) subscribeNext:^(id x) {
        [self.ticketButton setTitle:x forState:0];
    }];
    
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
