//
//  IllegalCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "IllegalCell.h"

@implementation IllegalCell

@dynamic item;


+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 200;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.backView];
    [self.contentView addSubview:self.codeLabel];
    [self.contentView addSubview:self.licenseLabel];
    [self.contentView addSubview:self.checkbutton];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.addressLabel];
    [self.contentView addSubview:self.resultLabel];
    [self.contentView addSubview:self.placeButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(smallSpacing, bigSpacing, smallSpacing, bigSpacing)];
        
        [self.codeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.backView withOffset:middleSpacing];
        [self.codeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.backView withOffset:middleSpacing];
        
        [self.licenseLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
        [self.licenseLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeLabel withOffset:middleSpacing];
        
        [self.checkbutton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.codeLabel];
        [self.checkbutton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.backView withOffset:-middleSpacing];
        
        [self.timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.codeLabel];
        [self.timeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.licenseLabel withOffset:30];
        
        [self.addressLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.timeLabel];
        [self.addressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.timeLabel withOffset:smallSpacing];
        
        [self.resultLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.addressLabel];
        [self.resultLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.addressLabel withOffset:smallSpacing];
        
        [self.placeButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.resultLabel];
        [self.placeButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.checkbutton];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView newAutoLayoutView];
        _backView.backgroundColor = MLLightGrayColor;
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

- (UIButton *)checkbutton {
    if (!_checkbutton) {
        _checkbutton = [UIButton newAutoLayoutView];
        _checkbutton.titleLabel.font = MLFont;
    }
    return _checkbutton;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel  = [UILabel newAutoLayoutView];
        _timeLabel.font = MLFont;
    }
    return _timeLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel newAutoLayoutView];
        _addressLabel.font = MLFont;
    }
    return _addressLabel;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [UILabel newAutoLayoutView];
        _resultLabel.font = MLFont;
    }
    return _resultLabel;
}

- (UIButton *)placeButton {
    if (!_placeButton) {
        _placeButton = [UIButton newAutoLayoutView];
        _placeButton.titleLabel.font = MLFont4;
    }
    return _placeButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    self.codeLabel.text = @"订单号订单号";
    self.licenseLabel.text = @"沪牌A";
    [self.checkbutton setTitle:@"查看详情>>" forState:0];
    self.timeLabel.text = @"违章时间：2015-09-09";
    self.addressLabel.text = @"违章地点：静安区铜仁路299弄";
    self.resultLabel.text = @"处理结果：待处理";
    [self.placeButton setTitle:@"违章地：上海" forState:0];
    
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
