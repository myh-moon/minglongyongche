//
//  ResultCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ResultCell.h"

@implementation ResultCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 560;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = MLBackGroundColor;
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.resultImageView];
    [self.contentView addSubview:self.resultLabel];
    [self.contentView addSubview:self.numberLabel1];
    [self.contentView addSubview:self.numberLabel2];
    [self.contentView addSubview:self.wayLabel1];
    [self.contentView addSubview:self.wayLabel2];
    [self.contentView addSubview:self.manLabel1];
    [self.contentView addSubview:self.manLabel2];
    [self.contentView addSubview:self.moneyLabel1];
    [self.contentView addSubview:self.moneyLabel2];
    [self.contentView addSubview:self.resultButton];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(50, bigSpacing, 50, bigSpacing)];
        
        [self.resultImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.backView withOffset:40];
        [self.resultImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        [self.resultLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.resultImageView];
        [self.resultLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.resultImageView withOffset:18];
        
        [self.numberLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.backView withOffset:bigSpacing];
        [self.numberLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.resultLabel withOffset:60];
        [self.numberLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.numberLabel1];
        [self.numberLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.backView withOffset:-bigSpacing];
        
        
        [self.wayLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.numberLabel1];
        [self.wayLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.numberLabel1 withOffset:bigSpacing];
        [self.wayLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.wayLabel1];
        [self.wayLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.numberLabel2];
        
        
        [self.manLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.numberLabel1];
        [self.manLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.wayLabel1 withOffset:bigSpacing];
        [self.manLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.manLabel1];
        [self.manLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.numberLabel2];
        
        
        [self.moneyLabel1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.numberLabel1];
        [self.moneyLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.manLabel1 withOffset:bigSpacing];
        [self.moneyLabel2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyLabel1];
        [self.moneyLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.numberLabel2];
        
        [self.resultButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.resultButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.backView withOffset:-MLCellHeight];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView newAutoLayoutView];
        _backView.backgroundColor = MLWhiteColor;
        _backView.layer.cornerRadius = 15;
        
        CALayer *layer = [_backView layer];
        layer.shadowColor = MLBlackColor.CGColor;
        layer.shadowOffset = CGSizeMake(4, 6);
        layer.shadowOpacity = 0.6;

    }
    return _backView;
}

- (UIImageView *)resultImageView {
    if (!_resultImageView) {
        _resultImageView = [UIImageView newAutoLayoutView];
        
    }
    return _resultImageView;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [UILabel newAutoLayoutView];
//        _resultLabel.text = @"支付成功\n";
        _resultLabel.numberOfLines = 0;
    }
    return _resultLabel;
}

- (UILabel *)numberLabel1 {
    if (!_numberLabel1) {
        _numberLabel1 = [UILabel newAutoLayoutView];
        _numberLabel1.textColor = MLLightGrayColor;
        _numberLabel1.font = MLFont;
        _numberLabel1.text = @"订单号";
    }
    return _numberLabel1;
}

- (UILabel *)numberLabel2 {
    if (!_numberLabel2) {
        _numberLabel2 = [UILabel newAutoLayoutView];
        _numberLabel2.textColor = MLLightGrayColor;
        _numberLabel2.font = MLFont;
    }
    return _numberLabel2;
}
- (UILabel *)wayLabel1 {
    if (!_wayLabel1) {
        _wayLabel1 = [UILabel newAutoLayoutView];
        _wayLabel1.textColor = MLLightGrayColor;
        _wayLabel1.font = MLFont;
        _wayLabel1.text = @"支付方式";
    }
    return _wayLabel1;
}
- (UILabel *)wayLabel2 {
    if (!_wayLabel2) {
        _wayLabel2 = [UILabel newAutoLayoutView];
        _wayLabel2.textColor = MLLightGrayColor;
        _wayLabel2.font = MLFont;
    }
    return _wayLabel2;
}
- (UILabel *)manLabel1 {
    if (!_manLabel1) {
        _manLabel1 = [UILabel newAutoLayoutView];
        _manLabel1.textColor = MLLightGrayColor;
        _manLabel1.font = MLFont;
        _manLabel1.text = @"租车人";
    }
    return _manLabel1;
}
- (UILabel *)manLabel2 {
    if (!_manLabel2) {
        _manLabel2 = [UILabel newAutoLayoutView];
        _manLabel2.textColor = MLLightGrayColor;
        _manLabel2.font = MLFont;
    }
    return _manLabel2;
}
- (UILabel *)moneyLabel1 {
    if (!_moneyLabel1) {
        _moneyLabel1 = [UILabel newAutoLayoutView];
        _moneyLabel1.textColor = MLLightGrayColor;
        _moneyLabel1.font = MLFont;
        _moneyLabel1.text = @"订单金额";
    }
    return _moneyLabel1;
}
- (UILabel *)moneyLabel2 {
    if (!_moneyLabel2) {
        _moneyLabel2 = [UILabel newAutoLayoutView];
        _moneyLabel2.textColor = MLLightGrayColor;
        _moneyLabel2.font = MLFont;
    }
    return _moneyLabel2;
}

- (UIButton *)resultButton {
    if (!_resultButton) {
        _resultButton = [UIButton newAutoLayoutView];
        [_resultButton swapImage];
        [_resultButton setImage:[UIImage imageNamed:@"gengduo"] forState:0];
        [_resultButton setTitleColor:UIColorFromRGB(0x42c021) forState:0];
        _resultButton.titleLabel.font = MLFont5;
        
        MLWeakSelf;
        [_resultButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(656);
            }
        }];
        
    }
    return _resultButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSInteger sele = [self.item.resultFlag integerValue] - 1;  //1-支付成功 2-支付取消 3-支付失败
    
    NSArray *imhArr = @[@"chenggong",@"shibai",];
    NSArray *textArr1 = @[@"支付成功\n",@"已完成支付？\n"];
    NSArray *textArr2 = @[@"请在你的预约时段内取还车",@"在你的预约时段内取还车"];
    NSArray *resArr = @[@"订单详情",@"订单详情"];
    
    [self.resultImageView setImage:[UIImage imageNamed:imhArr [sele]]];
    [self.resultLabel setAttributedText:[NSString setFirstPart:textArr1[sele] firstFont:16 firstColor:MLBlackColor secondPart:textArr2[sele] secondFont:14 secongColor:MLLightGrayColor space:15 align:1]];
    
    self.numberLabel2.text = self.item.number;
    self.wayLabel2.text = self.item.way;
    self.manLabel2.text = self.item.man;
    self.moneyLabel2.text = self.item.money;
    [self.resultButton setTitle:resArr[sele] forState:0];
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
