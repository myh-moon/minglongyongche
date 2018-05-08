//
//  PayCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayCell.h"

@implementation PayCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 60;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.payButton];
    [self.contentView addSubview:self.ssButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.payButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [self.payButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.ssButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.payButton];
        [self.ssButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)payButton {
    if (!_payButton) {
        _payButton = [UIButton newAutoLayoutView];
        _payButton.titleLabel.numberOfLines = 2;
        [_payButton setImage:[UIImage imageNamed:@"wechat"] forState:0];
        
//        [_payButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, smallSpacing)];
//        [_payButton setContentHorizontalAlignment:1];
//        [_payButton setTitleEdgeInsets:UIEdgeInsetsMake(0, bigSpacing, 0, 0)];
        
        [_payButton setAttributedTitle: [NSString setFirstPart:@"    微信支付\n" firstFont:14 firstColor:MLBlackColor secondPart:@"    亿万用户的选择，更快更安全" secondFont:12 secongColor:MLLightGrayColor space:6 align:0]  forState:0];
    }
    return _payButton;
}

- (UIButton *)ssButton {
    if (!_ssButton) {
        _ssButton = [UIButton newAutoLayoutView];
        [_ssButton setImage:[UIImage imageNamed:@"checked_circle_bg"] forState:0];
    }
    return _ssButton;
}
- (void)cellWillAppear {
    [super cellWillAppear];
    
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
