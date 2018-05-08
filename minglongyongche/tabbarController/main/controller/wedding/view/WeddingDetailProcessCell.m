//
//  WeddingDetailProcessCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "WeddingDetailProcessCell.h"

@implementation WeddingDetailProcessCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 100;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.processButton1];
    [self.contentView addSubview:self.arrow1];
    [self.contentView addSubview:self.processButton2];
    [self.contentView addSubview:self.arrow2];
    [self.contentView addSubview:self.processButton3];
    [self.contentView addSubview:self.arrow3];
    [self.contentView addSubview:self.processButton4];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        NSArray *views = @[self.processButton1,self.processButton2,self.processButton3,self.processButton4];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:bigSpacing];
        
        [views autoAlignViewsToAxis:ALAxisHorizontal];
        [views autoMatchViewsDimension:ALDimensionWidth];
        [views autoMatchViewsDimension:ALDimensionHeight];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
        [[views firstObject] autoSetDimension:ALDimensionWidth toSize:bigSpacing];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:middleSpacing];
        
        NSArray *views1 = @[self.arrow1,self.arrow2,self.arrow3];
        [views1 autoAlignViewsToAxis:ALAxisHorizontal];
        [views1 autoMatchViewsDimension:ALDimensionHeight];
        [views1 autoMatchViewsDimension:ALDimensionWidth];
        
        [self.arrow1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.processButton1];
        [self.arrow1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.processButton1];
        [self.arrow1 autoSetDimensionsToSize:CGSizeMake(bigSpacing, bigSpacing)];
        
        [self.arrow2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.processButton2];
        [self.arrow3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.processButton3];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

#pragma mark - getter
- (UIButton *)processButton1 {
    if (!_processButton1) {
        _processButton1  = [UIButton newAutoLayoutView];
        _processButton1.layer.borderColor = MLBlackColor.CGColor;
        _processButton1.layer.borderWidth = 1;
        _processButton1.titleLabel.font = MLFont1;
        [_processButton1 setTitleColor:MLLightGrayColor forState:0];
    }
    return _processButton1;
}

- (UIButton *)processButton2 {
    if (!_processButton2) {
        _processButton2  = [UIButton newAutoLayoutView];
        _processButton2.layer.borderColor = MLBlackColor.CGColor;
        _processButton2.layer.borderWidth = 1;
        _processButton2.titleLabel.font = MLFont1;
        [_processButton2 setTitleColor:MLLightGrayColor forState:0];
    }
    return _processButton2;
}

- (UIButton *)processButton3 {
    if (!_processButton3) {
        _processButton3  = [UIButton newAutoLayoutView];
        _processButton3.layer.borderColor = MLBlackColor.CGColor;
        _processButton3.layer.borderWidth = 1;
        _processButton3.titleLabel.font = MLFont1;
        [_processButton3 setTitleColor:MLLightGrayColor forState:0];
    }
    return _processButton3;
}

- (UIButton *)processButton4 {
    if (!_processButton4) {
        _processButton4  = [UIButton newAutoLayoutView];
        _processButton4.layer.borderColor = MLBlackColor.CGColor;
        _processButton4.layer.borderWidth = 1;
        _processButton4.titleLabel.font = MLFont1;
        [_processButton4 setTitleColor:MLLightGrayColor forState:0];
    }
    return _processButton4;
}

- (UIButton *)arrow1 {
    if (!_arrow1) {
        _arrow1 = [UIButton newAutoLayoutView];
        _arrow1.layer.borderWidth = 1;
        _arrow1.layer.borderColor = MLRedColor.CGColor;
    }
    return _arrow1;
}

- (UIButton *)arrow2 {
    if (!_arrow2) {
        _arrow2 = [UIButton newAutoLayoutView];
        _arrow2.layer.borderWidth = 1;
        _arrow2.layer.borderColor = MLRedColor.CGColor;
    }
    return _arrow2;
}

- (UIButton *)arrow3 {
    if (!_arrow3) {
        _arrow3 = [UIButton newAutoLayoutView];
        _arrow3.layer.borderWidth = 1;
        _arrow3.layer.borderColor = MLRedColor.CGColor;
    }
    return _arrow3;
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
