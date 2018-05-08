//
//  NewsCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.titleButton];
    [self.contentView addSubview:self.textButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.titleButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:bigSpacing];
        [self.titleButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.textButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:bigSpacing];
        [self.textButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [UIButton newAutoLayoutView];
        _titleButton.titleLabel.numberOfLines = 0;
    }
    return _titleButton;
}

- (UIButton *)textButton {
    if (!_textButton) {
        _textButton = [UIButton newAutoLayoutView];
        [_textButton setTitleColor:MLLightGrayColor forState:0];
        _textButton.titleLabel.font = MLFont1;
    }
    return _textButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.titleButton setAttributedTitle: [NSString setFirstPart: [NSString stringWithFormat:@"%@\n",self.item.titleStr] firstFont:14 firstColor:MLBlackColor secondPart:self.item.subtitleStr secondFont:10 secongColor:MLLightGrayColor] forState:0];
    
    if ([self.item.textStr isEqualToString:@""]) {
        [self.textButton setTitle:@">" forState:0];
    }else{
        [self.textButton setTitle:self.item.textStr forState:0];
    }
    
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
