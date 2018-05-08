//
//  PayAdditionCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayAdditionCell.h"

@implementation PayAdditionCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 140;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    self.backgroundColor = MLBackGroundColor;
    [self.contentView addSubview:self.rrButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.rrButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.rrButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        [self.rrButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.rrButton autoSetDimension:ALDimensionHeight toSize:MLCellHeight];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)rrButton {
    if (!_rrButton) {
        _rrButton = [UIButton newAutoLayoutView];
        [_rrButton setTitleColor:MLWhiteColor forState:0];
        _rrButton.titleLabel.font = MLFont5;
        [_rrButton setTitle:@"立即支付" forState:0];
        _rrButton.layer.cornerRadius = 3;
        _rrButton.backgroundColor = MLOrangeColor;
        
        MLWeakSelf;
        [_rrButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(33);
            }
        }];
    }
    return _rrButton;
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
