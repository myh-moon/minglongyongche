//
//  WordCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "WordCell.h"

@implementation WordCell
@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 80;
}

- (void)cellDidLoad {
    [self.contentView addSubview:self.singleTextField];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.singleTextField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(bigSpacing, bigSpacing, bigSpacing, bigSpacing)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UITextField *)singleTextField {
    if (!_singleTextField) {
        _singleTextField  = [UITextField newAutoLayoutView ];
        _singleTextField.placeholder = @"请输入兑换口令";
        _singleTextField.layer.borderColor = MLLightGrayColor.CGColor;
        _singleTextField.layer.borderWidth = 1;
    }
    return _singleTextField;
}


- (void)cellWillAppear {
    
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
