//
//  ConfirmTextCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmTextCell.h"

@implementation ConfirmTextCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 120;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.messageButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.messageButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(middleSpacing, bigSpacing, 0, bigSpacing)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)messageButton {
    if (!_messageButton) {
        _messageButton = [UIButton newAutoLayoutView];
        _messageButton.titleLabel.numberOfLines = 0;
        _messageButton.backgroundColor = MLBackGroundColor;
    }
    return _messageButton;
}


- (void)cellWillAppear {
    [super cellWillAppear];
//    [self.messageButton setAttributedTitle:[NSString setFirstPart:@"XX" firstFont:12 firstColor:MLBlackColor secondPart:@"车辆型号\n" secondFont:14 secongColor:MLBlackColor thirdPart:@"2016款 豪华设计" thirdFont:10 thirdColor:MLRedColor space:6] forState:0];
    
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
