//
//  MainSingleCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MainSingleCell.h"

@implementation MainSingleCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = MLBackGroundColor;

    
    [self.contentView addSubview:self.lpButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.lpButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.lpButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)lpButton {
    if (!_lpButton) {
        _lpButton = [UIButton newAutoLayoutView];
        [_lpButton setImage:[UIImage imageNamed:@"speaker"] forState:0];
    }
    return _lpButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.lpButton setAttributedTitle:[NSString setFirstPart:@"  邀请好友重磅好礼相随！" firstFont:11 firstColor:MLLightGrayColor secondPart:@"点击查看详情" secondFont:11 secongColor:MLOrangeColor] forState:0];
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
