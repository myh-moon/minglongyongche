//
//  MyOrderCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderCell.h"

@implementation MyOrderCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200;
}

- (void)cellDidLoad {
    [super cellDidLoad];
        
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.licenseLabel];
    [self.contentView addSubview:self.consumeLabel];
    [self.contentView addSubview:self.consumeButton];
    [self.contentView addSubview:self.fromLabel];
    [self.contentView addSubview:self.durationLabel];
    [self.contentView addSubview:self.resultLabel];
    [self.contentView addSubview:self.statusButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(smallSpacing, bigSpacing, smallSpacing, bigSpacing)];
        
        [self.codeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.backView withOffset:middleSpacing];
        [self.codeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.backView withOffset:middleSpacing];
        
        [self.licenseLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
        [self.licenseLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeLabel withOffset:middleSpacing];
        
        [self.consumeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.codeLabel];
        [self.consumeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        [self.consumeButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.licenseLabel];
        [self.consumeButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.consumeLabel];
        
        [self.fromLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.licenseLabel];
        [self.fromLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.licenseLabel withOffset:30];
        
        [self.durationLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.fromLabel];
        [self.durationLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.fromLabel withOffset:smallSpacing];
        
        [self.resultLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.durationLabel withOffset:smallSpacing];
        [self.resultLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.durationLabel];
        
        [self.statusButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.resultLabel];
        [self.statusButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.consumeButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView newAutoLayoutView];
        _backView.backgroundColor = MLBackGroundColor;
    }
    return _backView;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [UILabel newAutoLayoutView];
        _codeLabel.font = MLFont4;
    }
    return _codeLabel;
}

- (UILabel *)licenseLabel {
    if (!_licenseLabel) {
        _licenseLabel = [UILabel newAutoLayoutView];
        _licenseLabel.font = MLFont3;
    }
    return _licenseLabel;
}

- (UILabel *)consumeLabel {
    if (!_consumeLabel) {
        _consumeLabel = [UILabel newAutoLayoutView];
        _consumeLabel.font = MLFont1;
    }
    return _consumeLabel;
}

- (UIButton *)consumeButton {
    if (!_consumeButton) {
        _consumeButton = [UIButton newAutoLayoutView];
//        _consumeButton.titleLabel.font = MLFont2;
        _consumeButton.titleLabel.numberOfLines =0;
    }
    return _consumeButton;
}

- (UILabel *)fromLabel {
    if (!_fromLabel) {
        _fromLabel = [UILabel newAutoLayoutView];
        _fromLabel.font = MLFont;
    }
    return _fromLabel;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
        _durationLabel.font = MLFont;
    }
    return _durationLabel;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [UILabel newAutoLayoutView];
        _resultLabel.font = MLFont;
    }
    return _resultLabel;
}

- (UIButton *)statusButton {
    if (!_statusButton) {
        _statusButton = [UIButton newAutoLayoutView];
        _statusButton.titleLabel.font = MLFont;
    }
    return _statusButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.codeLabel.text = self.item.name;
    self.licenseLabel.text = self.item.license;
    
//    self.codeLabel.text = @"豪车豪车";
//    self.licenseLabel.text = @"沪牌A";
    self.consumeLabel.text = @"预计消费(元)";
    [self.consumeButton setAttributedTitle:[NSString setFirstPart:@"¥ " firstFont:10 firstColor:MLLightGrayColor secondPart:self.item.money secondFont:20 secongColor:MLBlackColor] forState:0];
    
    self.fromLabel.text  = [NSString stringWithFormat:@"借出：%@",self.item.qctime];
    self.durationLabel.text = [NSString stringWithFormat:@"还车：%@",self.item.hctime];
    
    self.resultLabel.text = self.item.result;
    
    [self.statusButton setTitle:self.item.status forState:0];
//
//    self.fromLabel.text = @"借出：09月23日 11:11";
//    self.durationLabel.text = @"短租：09月23日 11:11 至 09月24日 11:11";
//    self.resultLabel.text = @"还车：正在使用中";
//    [self.statusButton setTitle:@"进行中>" forState:0];
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
