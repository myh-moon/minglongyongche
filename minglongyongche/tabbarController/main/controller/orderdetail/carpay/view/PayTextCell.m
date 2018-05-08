//
//  PayTextCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayTextCell.h"

@implementation PayTextCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.contentView.backgroundColor = MLBackGroundColor;
    self.separatorInset = UIEdgeInsetsMake(0, MLWindowWidth, 0, 0);
    
    [self.contentView addSubview:self.ttButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.ttButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(smallSpacing, 0, bigSpacing, 0)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)ttButton {
    if (!_ttButton) {
        _ttButton = [UIButton newAutoLayoutView];
        _ttButton.backgroundColor = MLWhiteColor;
        _ttButton.titleLabel.numberOfLines = 0;
        _ttButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_ttButton setContentEdgeInsets:UIEdgeInsetsMake(0, bigSpacing, 0, 0)];
        
       
    }
    return _ttButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.ttButton setAttributedTitle:[NSString setFirstPart:@"订单名称：XX车辆订单名称\n" firstFont:14 firstColor:MLBlackColor secondPart:@"订单金额：XXX元" secondFont:14 secongColor:MLBlackColor] forState:0];
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
