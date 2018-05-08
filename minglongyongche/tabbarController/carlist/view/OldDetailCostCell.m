//
//  OldDetailCostCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OldDetailCostCell.h"

@implementation OldDetailCostCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 110;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.serviceCostLabel];
    [self.contentView addSubview:self.checkMoreButton];
    [self.contentView addSubview:self.serviceButton1];
    [self.contentView addSubview:self.serviceButton2];
    [self.contentView addSubview:self.serviceButton3];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.serviceCostLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:bigSpacing];
        [self.serviceCostLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        
        [self.checkMoreButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.serviceCostLabel];
        [self.checkMoreButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        [self.serviceButton1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.serviceCostLabel];
        [self.serviceButton1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.serviceCostLabel withOffset:middleSpacing];
        
        [self.serviceButton2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.serviceButton1 withOffset:100];
        [self.serviceButton2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.serviceButton1];
        
        [self.serviceButton3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.serviceButton1];
        [self.serviceButton3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.serviceButton1];
        
        self.didSetupConstraints  = YES;
    }
    [super updateConstraints];
}

- (UILabel *)serviceCostLabel {
    if (!_serviceCostLabel) {
        _serviceCostLabel  = [UILabel newAutoLayoutView];
    }
    return _serviceCostLabel;
}

- (UIButton *)checkMoreButton {
    if (!_checkMoreButton) {
        _checkMoreButton = [UIButton newAutoLayoutView];
        [_checkMoreButton setTitleColor:MLLightGrayColor forState:0];
        _checkMoreButton.titleLabel.font = MLFont3;
    }
    return _checkMoreButton;
}

- (UIButton *)serviceButton1 {
    if (!_serviceButton1) {
        _serviceButton1 = [UIButton newAutoLayoutView];
        [_serviceButton1 setTitleColor:MLLightGrayColor forState:0];
        _serviceButton1.titleLabel.font = MLFont1;
    }
    return _serviceButton1;
}

- (UIButton *)serviceButton2 {
    if (!_serviceButton2) {
        _serviceButton2 = [UIButton newAutoLayoutView];
        [_serviceButton2 setTitleColor:MLLightGrayColor forState:0];
        _serviceButton2.titleLabel.font = MLFont1;
    }
    return _serviceButton2;
}

- (UIButton *)serviceButton3 {
    if (!_serviceButton3) {
        _serviceButton3 = [UIButton newAutoLayoutView];
        [_serviceButton3 setTitleColor:MLLightGrayColor forState:0];
        _serviceButton3.titleLabel.font = MLFont1;
    }
    return _serviceButton3;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.serviceCostLabel setAttributedText:[NSString setFirstPart:@"服务费用：4000元" firstFont:12 firstColor:MLBlackColor secondPart:@"(车价 X 4%)" secondFont:10 secongColor: MLLightGrayColor]];
    
    [self.checkMoreButton setTitle:@"详情" forState:0];
    
    [self.serviceButton1 setTitle:@"整车质保" forState:0];
    
    [self.serviceButton2 setTitle:@"12天可退" forState:0];
    
    [self.serviceButton3 setTitle:@"车况检测" forState:0];
    
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
