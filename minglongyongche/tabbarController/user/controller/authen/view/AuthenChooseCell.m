//
//  AuthenChooseCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/27.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AuthenChooseCell.h"

@implementation AuthenChooseCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.dateButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.dateButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, middleSpacing, 0, middleSpacing)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)dateButton {
    if (!_dateButton) {
        _dateButton = [UIButton newAutoLayoutView];
        [_dateButton setTitleColor:MLLightGrayColor forState:0];
        _dateButton.titleLabel.font = MLFont;
        
        MLWeakSelf;
        [_dateButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(1234);
            }
        }];
    }
    return _dateButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.dateButton setTitle:self.item.dateString forState:0];
    [self.dateButton setContentHorizontalAlignment:1];
    
    [RACObserve(self.item, dateString) subscribeNext:^(id x) {
        [self.dateButton setTitle:x forState:0];
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
