//
//  LoginAgreeCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "LoginAgreeCell.h"

@implementation LoginAgreeCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 300;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = MLLoginColor;
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.agreeBtn];
    [self.contentView addSubview:self.contentBtn];
    
    [self.contentView addSubview:self.loginBtn];
    [self.contentView addSubview:self.orLabel];
    [self.contentView addSubview:self.llImageView];
    [self.contentView addSubview:self.rrImageView];
    [self.contentView addSubview:self.registerBtn];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
      
        [self.agreeBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
        [self.agreeBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:50];
        
        [self.contentBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.agreeBtn];
        [self.contentBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.agreeBtn];
        
        [self.loginBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.agreeBtn withOffset:bigSpacing];
        [self.loginBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.agreeBtn];
        [self.loginBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:loginSpace];
        [self.loginBtn autoSetDimension:ALDimensionHeight toSize:40];
        
        [self.orLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.orLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.loginBtn withOffset:40];
        
        [self.registerBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.orLabel withOffset:40];
        [self.registerBtn autoAlignAxisToSuperviewAxis:ALAxisVertical];
//        [self.registerBtn autoSetDimension:ALDimensionWidth toSize:165];
        
        [self.llImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.registerBtn];
//        [self.llImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.loginBtn];
        [self.llImageView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.registerBtn withOffset:-middleSpacing];
        
        [self.rrImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.registerBtn withOffset:middleSpacing];
        [self.rrImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.registerBtn];
//        [self.rrImageView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.loginBtn];
        
//        NSArray *views = @[self.llImageView,self.registerBtn,self.rrImageView];
//        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
//        [self.llImageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.loginBtn];
//        [self.llImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.orLabel withOffset:40];
//        [self.llImageView autoSetDimensionsToSize:CGSizeMake(50, 10)];
//
//        [self.rrImageView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.loginBtn];
//        [self.rrImageView autoSetDimensionsToSize:CGSizeMake(50, 10)];
//
//        [self.registerBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.llImageView withOffset:middleSpacing];
//        [self.registerBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rrImageView withOffset:-middleSpacing];
      
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)agreeBtn {
    if (!_agreeBtn) {
        _agreeBtn = [UIButton newAutoLayoutView];
        [_agreeBtn setTitle:@"  已阅读并同意" forState:0];
        [_agreeBtn setTitleColor:MLWhiteColor forState:0];
        _agreeBtn.titleLabel.font = MLFont8;
        [_agreeBtn setImage:[UIImage imageNamed:@"checkboxed"] forState:0];
        [_agreeBtn setImage:[UIImage imageNamed:@"uncheckboxed"] forState:UIControlStateSelected];
        _agreeBtn.tag = 23;
        
        MLWeakSelf;
        [_agreeBtn addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(23);
            }
        }];
        
    }
    return _agreeBtn;
}

- (UIButton *)contentBtn {
    if (!_contentBtn) {
        _contentBtn = [UIButton newAutoLayoutView];
        [_contentBtn setTitle:@"《鸣垄名车使用许可及服务协议》" forState:0];
        [_contentBtn setTitleColor:MLOrangeColor forState:0];
        _contentBtn.titleLabel.font = MLFont8;
        _contentBtn.tag = 24;
        
        MLWeakSelf;
        [_contentBtn addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(24);
            }
        }];
    }
    return _contentBtn;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton newAutoLayoutView];
        [_loginBtn setTitle:@"立即登录" forState:0];
        [_loginBtn setTitleColor:MLWhiteColor forState:0];
        _loginBtn.backgroundColor = MLOrangeColor;
        _loginBtn.titleLabel.font = MLFont4;
        _loginBtn.layer.cornerRadius = MLRadius;
        _loginBtn.tag = 25;
        
        MLWeakSelf;
        [_loginBtn addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(25);
            }
        }];
        
    }
    return _loginBtn;
}

- (UILabel *)orLabel {
    if (!_orLabel) {
        _orLabel = [UILabel newAutoLayoutView];
        _orLabel.text = @"或";
        _orLabel.textColor = MLWhiteColor;
        _orLabel.font = MLFont;
    }
    return _orLabel;
}

- (UIImageView *)llImageView {
    if (!_llImageView) {
        _llImageView = [UIImageView newAutoLayoutView];
        [_llImageView setImage:[UIImage imageNamed:@"fenge_left"]];
    }
    return _llImageView;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [UIButton newAutoLayoutView];
        [_registerBtn setTitle:@"现在不想注册，跳过登录" forState:0];
        [_registerBtn setTitleColor:MLWhiteColor forState:0];
        _registerBtn.titleLabel.font = MLFont5;
        _registerBtn.tag = 26;
        
        MLWeakSelf;
        [_registerBtn addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(26);
            }
        }];
        
    }
    return _registerBtn;
}

- (UIImageView *)rrImageView {
    if (!_rrImageView) {
        _rrImageView = [UIImageView newAutoLayoutView];
        [_rrImageView setImage:[UIImage imageNamed:@"fenge_right"]];
    }
    return _rrImageView;
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
