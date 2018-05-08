//
//  AuthenPhotoCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AuthenPhotoCell.h"

@implementation AuthenPhotoCell
+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
//    return 60+middleSpacing*2;
    
    return 150;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.photoButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.photoButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(middleSpacing, middleSpacing, 0, middleSpacing)];
//        [self.photoButton autoSetDimension:ALDimensionHeight toSize:60];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)photoButton {
    if (!_photoButton) {
        _photoButton = [UIButton newAutoLayoutView];
        _photoButton.backgroundColor = MLBackGroundColor;
        [_photoButton setTitleColor:MLRedColor forState:0];
        _photoButton.titleLabel.font = MLFont4;
        
        MLWeakSelf;
        [_photoButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(456);
            }
        }];
    }
    return _photoButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSString *completeStr = [NSString stringWithFormat:@"请上传身份证%@照",self.item.photoType];
    [self.photoButton setTitle:completeStr forState:0];
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
