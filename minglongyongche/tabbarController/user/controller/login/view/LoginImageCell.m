//
//  LoginImageCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "LoginImageCell.h"

@implementation LoginImageCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 240;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = MLLoginColor;
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.imgBtn];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
//        [self.imgBtn autoAlignAxisToSuperviewAxis:ALAxisVertical];
//        [self.imgBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.imgBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)imgBtn {
    if (!_imgBtn) {
        _imgBtn = [UIButton newAutoLayoutView];
        [_imgBtn setImage:[UIImage imageNamed:@"bg"] forState:0];
        _imgBtn.userInteractionEnabled = NO;
//        [_imgBtn setImage:[UIImage imageNamed:@"bg"]];
//        [_imgBtn setBackgroundImage:[UIImage imageNamed:@"bg"] forState:0];
    }
    return _imgBtn;
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
