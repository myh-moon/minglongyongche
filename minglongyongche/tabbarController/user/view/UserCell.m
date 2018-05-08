//
//  UserCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 170;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
//    self.sele = NO;
    
//    [self.contentView addSubview:self.settingButton];
    [self.contentView addSubview:self.userImageView];
    [self.contentView addSubview:self.userNameButton];
    [self.contentView addSubview:self.userAuthenBtn];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
//        [self.settingButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:smallSpacing];
//        [self.settingButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
//        [self.userImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.settingButton ];
        [self.userImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
        [self.userImageView autoSetDimensionsToSize:CGSizeMake(65,65)];
        [self.userImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.userNameButton autoAlignAxis:ALAxisVertical toSameAxisOfView:self.userImageView];
        [self.userNameButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.userImageView withOffset:smallSpacing];
        
        [self.userAuthenBtn autoAlignAxis:ALAxisVertical toSameAxisOfView:self.userNameButton];
        [self.userAuthenBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.userNameButton withOffset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)settingButton {
    if (!_settingButton) {
        _settingButton = [UIButton newAutoLayoutView];
        [_settingButton setImage:[UIImage imageNamed:@"mine_setting"] forState:0];
    }
    return _settingButton;
}

- (UIImageView *)userImageView {
    if (!_userImageView) {
        _userImageView = [UIImageView newAutoLayoutView];
        _userImageView.layer.cornerRadius = 32.5;
        _userImageView.layer.masksToBounds = YES;
    }
    return _userImageView;
}

- (UIButton *)userNameButton {
    if (!_userNameButton) {
        _userNameButton = [UIButton newAutoLayoutView];
        _userNameButton.titleLabel.font = MLFont5;
        [_userNameButton setTitleColor:MLBlackColor forState:0];
        [_userNameButton swapImage];
        [_userNameButton setImage:[UIImage imageNamed:@"arrow_right"] forState:0];
        
        MLWeakSelf;
        [_userNameButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(88);
            }
        }];
    }
    return _userNameButton;
}

- (UIButton *)userAuthenBtn {
    if (!_userAuthenBtn) {
        _userAuthenBtn = [UIButton newAutoLayoutView];
        _userAuthenBtn.titleLabel.font = MLFont1;
        [_userAuthenBtn setTitleColor:MLLightGrayColor forState:0];
        
        MLWeakSelf;
        [_userAuthenBtn addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(89);
            }
        }];
    }
    return _userAuthenBtn;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.userImageView setImage:[UIImage imageNamed:@"moreng"]];    
    
    [self.userNameButton setTitle:self.item.userName forState:0];
    [self.userAuthenBtn setTitle:self.item.isAuthen forState:0];
    
    if ([self.item.isAuthen isEqualToString:@"您还未通过实名认证，去认证！"]) {
        self.userAuthenBtn.userInteractionEnabled = YES;
    }else {
        self.userAuthenBtn.userInteractionEnabled = NO;
    }
    
    
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
