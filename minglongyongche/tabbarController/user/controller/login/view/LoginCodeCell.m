//
//  LoginCodeCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "LoginCodeCell.h"

@implementation LoginCodeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight+bigSpacing;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = MLLoginColor;
    
    self.separatorInset = UIEdgeInsetsMake(0, 30+56+smallSpacing, 0, 30+90+smallSpacing);
    
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.codeTextField];
    [self.contentView addSubview:self.codeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.codeLabel,self.codeTextField,self.codeButton];
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
//        [self.codeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.codeLabel autoSetDimension:ALDimensionWidth toSize:56];
        [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:smallSpacing];
        
        [self.codeTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.codeLabel withOffset:smallSpacing];
        [self.codeTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.codeButton withOffset:-middleSpacing];
        
        [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
        [self.codeButton autoSetDimensionsToSize:CGSizeMake(90, 36)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.textColor = MLWhiteColor;
        _codeLabel.font = MLFont4;
        _codeLabel.text = @"验证码:";
    }
    return _codeLabel;
}

- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [UITextField newAutoLayoutView];
        _codeTextField.font = MLFont5;
        _codeTextField.placeholder = @"请输入验证码";
        _codeTextField.textColor = MLWhiteColor;
        
        MLWeakSelf;
        [_codeTextField.rac_textSignal subscribeNext:^(id x) {
            if (weakself.item.didChangeText) {
                weakself.item.didChangeText(x);
            }
        }];
        
    }
    return _codeTextField;
}

- (JKCountDownButton *)codeButton {
    if (!_codeButton) {
        _codeButton = [JKCountDownButton newAutoLayoutView];
        _codeButton.backgroundColor = MLWhiteColor;
        [_codeButton setTitleColor:MLOrangeColor forState:0];
        _codeButton.titleLabel.font = MLFont;
        [_codeButton setTitle:@"获取验证码" forState:0];
        _codeButton.layer.cornerRadius = 3;
        
        [_codeButton addTarget:self action:@selector(countDownWithButton:) forControlEvents:UIControlEventTouchUpInside];
        
//        [_codeButton startCountDownWithSecond:60];
        
        MLWeakSelf;
//        [_codeButton addAction:^(UIButton *btn) {
//    
//
//            if (weakself.item.didSelectedBtn) {
//                weakself.item.didSelectedBtn(12);
//            }
//        }];
    }
    return _codeButton;
}

- (void) countDownWithButton:(JKCountDownButton *)sender {
    
    [sender startCountDownWithSecond:60];
    [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
        [sender setBackgroundColor:MLGrayColor];
        [sender setTitleColor:MLWhiteColor forState:0];
        sender.userInteractionEnabled = NO;
        NSString *eeee = [NSString stringWithFormat:@"还剩%lus",(unsigned long)second];
        return eeee;
    }];
    
    [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
        [sender setBackgroundColor:MLOrangeColor];
        [sender setTitleColor:MLWhiteColor forState:0];
        sender.userInteractionEnabled = YES;
        return @"获取验证码";
    }];
    
    if (self.item.didSelectedBtn) {
        self.item.didSelectedBtn(12);
    }
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
