//
//  AuthenConfirmCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AuthenConfirmCell.h"

@implementation AuthenConfirmCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight+60+60;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.confirmButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.confirmButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(MLCellHeight, middleSpacing, 0, middleSpacing) excludingEdge:ALEdgeBottom];
        [self.confirmButton autoSetDimension:ALDimensionHeight toSize:60];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [UIButton newAutoLayoutView];
        _confirmButton.backgroundColor = MLOrangeColor;
        [_confirmButton setTitle:@"立即认证" forState:0];
        [_confirmButton setTitleColor:MLWhiteColor forState:0];
        _confirmButton.titleLabel.font = MLFont4;
        
        MLWeakSelf;
        [_confirmButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(456);
            }
        }];
    }
    return _confirmButton;
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
