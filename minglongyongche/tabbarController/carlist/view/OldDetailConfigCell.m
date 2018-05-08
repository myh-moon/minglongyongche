//
//  OldDetailConfigCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OldDetailConfigCell.h"

@implementation OldDetailConfigCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 140;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.configButton1];
    [self.contentView addSubview:self.configButton2];
    [self.contentView addSubview:self.configButton3];
    [self.contentView addSubview:self.configButton4];
    [self.contentView addSubview:self.configButton5];
    [self.contentView addSubview:self.configButton6];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views1 = @[self.configButton1,self.configButton2,self.configButton3];
        [views1 autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0];
        
        [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:bigSpacing];
        [[views1 lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        NSArray *views2 = @[self.configButton4,self.configButton5,self.configButton6];
        [views2 autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0];
        
        [[views2 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [[views2 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.configButton1 withOffset:bigSpacing];
        [[views2 lastObject]autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)configButton1 {
    if (!_configButton1) {
        _configButton1 = [UIButton newAutoLayoutView];
        _configButton1.titleLabel.numberOfLines = 0;
        _configButton1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _configButton1;
}

- (UIButton *)configButton2 {
    if (!_configButton2) {
        _configButton2 = [UIButton newAutoLayoutView];
        _configButton2.titleLabel.numberOfLines = 0;
        _configButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _configButton2;
}


- (UIButton *)configButton3 {
    if (!_configButton3) {
        _configButton3 = [UIButton newAutoLayoutView];
        _configButton3.titleLabel.numberOfLines = 0;
        _configButton3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _configButton3;
}


- (UIButton *)configButton4 {
    if (!_configButton4) {
        _configButton4 = [UIButton newAutoLayoutView];
        _configButton4.titleLabel.numberOfLines = 0;
        _configButton4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _configButton4;
}

- (UIButton *)configButton5 {
    if (!_configButton5) {
        _configButton5 = [UIButton newAutoLayoutView];
        _configButton5.titleLabel.numberOfLines = 0;
        _configButton5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _configButton5;
}

- (UIButton *)configButton6 {
    if (!_configButton6) {
        _configButton6 = [UIButton newAutoLayoutView];
        _configButton6.titleLabel.numberOfLines = 0;
        _configButton6.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _configButton6;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.configButton1 setAttributedTitle: [NSString setFirstPart:@"国四\n" firstFont:14 firstColor:MLBlackColor secondPart:@"国四标准" secondFont:10 secongColor:MLLightGrayColor] forState:0];
    
    [self.configButton2 setAttributedTitle: [NSString setFirstPart:@"国四\n" firstFont:14 firstColor:MLBlackColor secondPart:@"国四标准" secondFont:10 secongColor:MLLightGrayColor] forState:0];

    [self.configButton3 setAttributedTitle: [NSString setFirstPart:@"国四\n" firstFont:14 firstColor:MLBlackColor secondPart:@"国四标准" secondFont:10 secongColor:MLLightGrayColor] forState:0];
    
    [self.configButton4 setAttributedTitle: [NSString setFirstPart:@"国\n" firstFont:14 firstColor:MLBlackColor secondPart:@"国四标准" secondFont:10 secongColor:MLLightGrayColor] forState:0];
    
    [self.configButton5 setAttributedTitle: [NSString setFirstPart:@"四\n" firstFont:14 firstColor:MLBlackColor secondPart:@"国四标准" secondFont:10 secongColor:MLLightGrayColor] forState:0];
    
    [self.configButton6 setAttributedTitle: [NSString setFirstPart:@"国\n" firstFont:14 firstColor:MLBlackColor secondPart:@"国四标准" secondFont:10 secongColor:MLLightGrayColor] forState:0];

    
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
