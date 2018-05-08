//
//  AccountPayCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AccountPayCell.h"

@implementation AccountPayCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 70;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.singleButton];
   
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.singleButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, bigSpacing, 10, bigSpacing)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)singleButton {
    if (!_singleButton) {
        _singleButton = [UIButton newAutoLayoutView];
        _singleButton.backgroundColor = MLLightGrayColor;
//        [_singleButton setTitle:@"立即充值" forState:0];
        [_singleButton setTitleColor:MLWhiteColor forState:0];
        _singleButton.titleLabel.font = MLFont2;
    }
    return _singleButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.singleButton setTitle:self.item.actStr forState:0];
    
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
