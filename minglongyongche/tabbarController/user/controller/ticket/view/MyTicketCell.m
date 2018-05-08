//
//  MyTicketCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyTicketCell.h"

@implementation MyTicketCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 140;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    self.backgroundColor = MLBackGroundColor;
    
    [self.contentView addSubview:self.topBackView];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.sourceLabel];
    
    [self.contentView addSubview:self.bottomBackView];
    [self.contentView addSubview:self.expirationLabel];
    [self.contentView addSubview:self.validLabel];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.topBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, middleSpacing, 0, middleSpacing) excludingEdge:ALEdgeBottom];
        [self.topBackView autoSetDimension:ALDimensionHeight toSize:105];
        
        [self.moneyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.topBackView];
        [self.moneyLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.topBackView];
        [self.moneyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.topBackView];
        [self.moneyLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.moneyLabel];
        
        [self.sourceLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.topBackView withOffset:middleSpacing];
//        [self.sourceLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.topBackView];
//        [self.sourceLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.topBackView];
        [self.sourceLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.moneyLabel];
        [self.sourceLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyLabel];
        
        [self.bottomBackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, middleSpacing, 0, middleSpacing) excludingEdge:ALEdgeTop];
        [self.bottomBackView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.topBackView];
        
        [self.expirationLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.sourceLabel];
        [self.expirationLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.bottomBackView];
        
        [self.validLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.expirationLabel];
        [self.validLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.bottomBackView withOffset:-middleSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIView *)topBackView {
    if (!_topBackView) {
        _topBackView.translatesAutoresizingMaskIntoConstraints = YES;
        _topBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MLWindowWidth-middleSpacing*2, 105)];
        _topBackView.backgroundColor = MLWhiteColor;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_topBackView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.path = path.CGPath;
        layer.frame = _topBackView.bounds;
        _topBackView.layer.mask = layer;
    }
    return _topBackView;
}

- (UILabel *)sourceLabel {
    if (!_sourceLabel) {
        _sourceLabel.translatesAutoresizingMaskIntoConstraints = YES;
        _sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MLWindowWidth-middleSpacing*3-105, 105)];
        _sourceLabel.numberOfLines = 0;
    }
    return _sourceLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel.translatesAutoresizingMaskIntoConstraints = YES;
        _moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 105, 105)];
        _moneyLabel.textAlignment = NSTextAlignmentCenter;
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.backgroundColor = MLLightGrayColor.CGColor;
        layer.frame = CGRectMake(0, bigSpacing, 1, 75);
        [_moneyLabel.layer addSublayer:layer];
    }
    return _moneyLabel;
}

- (UIView *)bottomBackView {
    if (!_bottomBackView) {
        _bottomBackView.translatesAutoresizingMaskIntoConstraints = YES;
        _bottomBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MLWindowWidth-middleSpacing*2, 35)];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_bottomBackView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.path = path.CGPath;
        layer.frame = _bottomBackView.bounds;
        _bottomBackView.layer.mask = layer;
    }
    return _bottomBackView;
}

- (UILabel *)expirationLabel {
    if (!_expirationLabel) {
        _expirationLabel = [UILabel newAutoLayoutView];
        _expirationLabel.font = MLFont3;
    }
    return _expirationLabel;
}

- (UILabel *)validLabel {
    if (!_validLabel) {
        _validLabel = [UILabel newAutoLayoutView];
        _validLabel.font = MLFont3;
    }
    return _validLabel;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    //info  RELabel
    if (self.item.status == 0) {
        
        self.bottomBackView.backgroundColor = UIColorFromRGB(0xfafafa);
        
        self.sourceLabel.attributedText = [NSString setFirstPart:self.item.source firstFont:15 firstColor:MLBlackColor secondPart:self.item.sourceDetail1 secondFont:13 secongColor:MLLightGrayColor thirdPart:self.item.sourceDetail2 thirdFont:13 thirdColor:MLLightGrayColor space:8 align:0];
        
        [self.moneyLabel setAttributedText:[NSString setFirstPart:@"¥" firstFont:25 firstColor:MLOrangeColor secondPart:@"10" secondFont:50 secongColor:MLOrangeColor]];
        
        self.expirationLabel.textColor = UIColorFromRGB(0xd4adad);
        
        self.validLabel.textColor = UIColorFromRGB(0xd4aeae);
    }else{

        self.bottomBackView.backgroundColor = UIColorFromRGB(0xeeee);

        self.sourceLabel.attributedText = [NSString setFirstPart:self.item.source firstFont:15 firstColor:MLLightGrayColor secondPart:self.item.sourceDetail1 secondFont:13 secongColor:MLLightGrayColor thirdPart:self.item.sourceDetail2 thirdFont:13 thirdColor:MLLightGrayColor space:8 align:0];
        
        [self.moneyLabel setAttributedText:[NSString setFirstPart:@"¥" firstFont:25 firstColor:MLLightGrayColor secondPart:@"10" secondFont:50 secongColor:MLLightGrayColor]];
       
        self.expirationLabel.textColor = MLLightGrayColor;
        
        self.validLabel.textColor = MLLightGrayColor;
    }
    
    self.expirationLabel.text = self.item.overdueTime;
    self.validLabel.text = self.item.validDays;
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
