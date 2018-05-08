//
//  AccountMoneyCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AccountMoneyCell.h"

@implementation AccountMoneyCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 50;
}

- (void)cellDidLoad {
    
    [super cellDidLoad];
    
    [self.contentView addSubview:self.singleButton];

    [self setNeedsUpdateConstraints];
    
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.singleButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [self.singleButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)singleButton {
    if (!_singleButton) {
        _singleButton = [UIButton newAutoLayoutView];
        _singleButton.titleLabel.numberOfLines = 0;
        
        [_singleButton setAttributedTitle: [NSString  setFirstPart:@"我的余额（元）\n\n" firstFont:14 firstColor:MLLightGrayColor secondPart:@"¥   " secondFont:14 secongColor:MLBlackColor thirdPart:@"500.00元" thirdFont:24 thirdColor:MLBlackColor] forState:0];
    }
    return _singleButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.singleButton setAttributedTitle: [NSString setFirstPart:@"实际到账：" firstFont:14 firstColor:MLLightGrayColor secondPart:@"1200元" secondFont:14 secongColor:MLBlackColor] forState:0];
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
