//
//  PayMoneyCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayMoneyCell.h"

@implementation PayMoneyCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    if ([self.item.type isEqualToString:@"deposit"]) {
        
        [self.leftbutton setAttributedTitle:[NSString setFirstPart:@"用车押金  ¥" firstFont:14 firstColor:MLDrakGrayColor secondPart:self.item.deposit secondFont:14 secongColor:MLGrayColor] forState:0];
        [self.rightButton setTitle:self.item.surplus forState:0];
        
    }else if ([self.item.type isEqualToString:@"surplus"]){
        NSString *secondStr = [NSString stringWithFormat:@"¥%@",self.item.deposit];
        
        [self.leftbutton setAttributedTitle:[NSString setFirstPart:@"还需付款：" firstFont:13 firstColor:MLBlackColor secondPart:secondStr secondFont:16 secongColor:MLOrangeColor] forState:0];
        
        [self.rightButton setTitle:@"" forState:0];
    }
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.leftbutton];
    [self.contentView addSubview:self.rightButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.leftbutton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [self.leftbutton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.rightButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.leftbutton];
        [self.rightButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)leftbutton {
    if (!_leftbutton) {
        _leftbutton = [UIButton newAutoLayoutView];
        [_leftbutton setTitleColor:MLBlackColor forState:0];
        _leftbutton.titleLabel.font = MLFont;
    }
    return _leftbutton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton newAutoLayoutView];
        [_rightButton setTitleColor:MLDrakGrayColor forState:0];
        _rightButton.titleLabel.font = MLFont;
    }
    return _rightButton;
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
