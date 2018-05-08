//
//  ConfirmCostCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmCostCell.h"

@implementation ConfirmCostCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 130;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
//    [self.contentView addSubview:self.chargeLabel];
//    [self.contentView addSubview:self.selectButton];
    [self.contentView addSubview:self.costLabel];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
//        [self.chargeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
//        [self.chargeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
//
//        [self.selectButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.chargeLabel];
//        [self.selectButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        
        [self.costLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        [self.costLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:bigSpacing];
    
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)chargeLabel {
    if (!_chargeLabel) {
        _chargeLabel = [UILabel newAutoLayoutView];
        _chargeLabel.textColor = MLBlackColor;
        _chargeLabel.font = MLFont;
    }
    return _chargeLabel;
}

- (UIButton *)selectButton {
    if (!_selectButton) {
        _selectButton = [UIButton newAutoLayoutView];
        [_selectButton setImage:[UIImage imageNamed:@"checked_circle_bg"] forState:0];
        [_selectButton setImage:[UIImage imageNamed:@"unchecked_circle_bg"] forState:UIControlStateSelected];
        
        [_selectButton addAction:^(UIButton *btn) {
            btn.selected = !btn.selected;
        }];
    }
    return _selectButton;
}

- (UILabel *)costLabel {
    if (!_costLabel) {
        _costLabel = [UILabel newAutoLayoutView];
        _costLabel.textColor = MLDrakGrayColor;
        _costLabel.font = MLFont;
    }
    return _costLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    self.chargeLabel.text = @"余额200元";
//    self.costLabel.text = @"总共300元";
    
    
    [RACObserve(self.item, costMoney) subscribeNext:^(id x) {
        NSString *cast = [NSString stringWithFormat:@"费用合计：%@",x];
        self.costLabel.text = cast;
        
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
