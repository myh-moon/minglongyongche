//
//  ConfirmPhoneCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmPhoneCell.h"

@implementation ConfirmPhoneCell

//+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return 80;
//}

- (void)cellDidLoad {
    [super cellDidLoad];
        
    [self.contentView addSubview:self.leftButton];
    [self.contentView addSubview:self.rightButton];
    [self.contentView addSubview:self.lineImageView];
    
    [self setNeedsUpdateConstraints];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        [self.leftButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.leftButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.rightButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        [self.rightButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.leftButton];
        
        [self.lineImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton newAutoLayoutView];
        [_leftButton setTitle:@"phone" forState:0];
        [_leftButton setTitleColor:MLBlackColor forState:0];
        _leftButton.titleLabel.font = MLFont;
        _leftButton.userInteractionEnabled = NO;
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton newAutoLayoutView];
        [_rightButton setImage:[UIImage imageNamed:@"arrow_right"] forState:0];
        _rightButton.userInteractionEnabled = NO;
    }
    return _rightButton;
}

- (UIImageView *)lineImageView {
    if (!_lineImageView) {
        _lineImageView = [UIImageView newAutoLayoutView];
        [_lineImageView setImage:[UIImage imageNamed:@"color_dividing_line"]];
    }
    return _lineImageView;
}

- (void)cellWillAppear {
    [super cellWillAppear];

    [self.leftButton setImage:[UIImage imageNamed:self.item.leftImage] forState:0];
    [self.leftButton setTitle:self.item.leftTitle forState:0];
    [self.leftButton setTitleColor:self.item.leftColor forState:0];
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:self.item.leftFont];
    
    [self.rightButton setImage:[UIImage imageNamed:self.item.rightImage] forState:0];
    
    
    [self.lineImageView setHidden:self.item.isHidden];
    
    
    [RACObserve(self.item, leftTitle) subscribeNext:^(id x) {
        [self.leftButton setTitle:x forState:0];
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
