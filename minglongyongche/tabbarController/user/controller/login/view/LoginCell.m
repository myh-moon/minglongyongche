//
//  LoginCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight+bigSpacing;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = MLLoginColor;
    self.separatorInset = UIEdgeInsetsMake(0, 56+30+smallSpacing, 0, 30);
    
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.codeTextField];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
//        [self.codeLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.codeLabel autoSetDimension:ALDimensionWidth toSize:56];
        [self.codeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:smallSpacing];
        
        [self.codeTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.codeLabel];
        [self.codeTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.codeLabel withOffset:smallSpacing];
        [self.codeTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.textColor = MLWhiteColor;
        _codeLabel.font = MLFont4;
        _codeLabel.text = @"手机号:";
    }
    return _codeLabel;
}

- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [UITextField newAutoLayoutView];
        _codeTextField.font = MLFont5;
        _codeTextField.placeholder = @"手机号登录即为注册";
        _codeTextField.textColor = MLWhiteColor;
        
//        [[_codeTextField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(id x) {
//            NSLog(@"%@",x);
//        }];
        
        MLWeakSelf;
        [_codeTextField.rac_textSignal subscribeNext:^(id x) {
            if (weakself.item.didChangeText) {
                weakself.item.didChangeText(x);
            }
        }];
       
    }
    return _codeTextField;
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
