//
//  ConfirmDateCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmDateCell.h"

@implementation ConfirmDateCell

@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 65;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.dateFromButton];
    [self.contentView addSubview:self.durationLabel];
    [self.contentView addSubview:self.lineImageView];
    [self.contentView addSubview:self.ddLabel];
    [self.contentView addSubview:self.dateEndButton];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.dateFromButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.dateFromButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.lineImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.lineImageView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.durationLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.lineImageView];
        [self.durationLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.lineImageView];
        
        [self.ddLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.lineImageView];
        [self.ddLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineImageView];

        [self.dateEndButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        [self.dateEndButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.dateFromButton];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)dateFromButton {
    if (!_dateFromButton) {
        _dateFromButton = [UIButton newAutoLayoutView];
//        [_dateFromButton setTitle:@"请选择\n取车时间" forState:0];
//        [_dateFromButton setTitleColor:MLGrayColor forState:0];
//        _dateFromButton.titleLabel.font = MLFont;
        _dateFromButton.titleLabel.numberOfLines = 0;
        
        MLWeakSelf;
        [_dateFromButton addAction:^(UIButton *btn) {
//            weakself.item.starttime = @"123";
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(45);
            }
        }];
    }
    return _dateFromButton;
}

- (UILabel *)durationLabel {
    if (!_durationLabel) {
        _durationLabel = [UILabel newAutoLayoutView];
        _durationLabel.textColor = MLOrangeColor;
        _durationLabel.font = MLFont8;
    }
    return _durationLabel;
}

- (UIImageView *)lineImageView {
    if (!_lineImageView) {
        _lineImageView = [UIImageView newAutoLayoutView];
        [_lineImageView setImage:[UIImage imageNamed:@"arrow_time_between"]];
    }
    return _lineImageView;
}

- (UILabel *)ddLabel {
    if (!_ddLabel) {
        _ddLabel = [UILabel newAutoLayoutView];
        _ddLabel.textColor = MLOrangeColor;
//        _ddLabel.text = @"租期";
        _ddLabel.font = MLFont8;
    }
    return _ddLabel;
}

- (UIButton *)dateEndButton {
    if (!_dateEndButton) {
        _dateEndButton = [UIButton newAutoLayoutView];
        _dateEndButton.titleLabel.numberOfLines = 0;
        
        MLWeakSelf;
        [_dateEndButton addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(46);
            }
//            if ([weakself.dateFromButton.titleLabel.text containsString:@"请选择"]) {
//                NSLog(@"未选择借出时间");
//            }else{
//            }
        }];
    }
    return _dateEndButton;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSString *ss = [NSString stringWithFormat:@"%@\n",self.item.startDate];
    NSString *ee = [NSString stringWithFormat:@"%@\n",self.item.endDate];
    
    [self.dateFromButton setAttributedTitle: [NSString setFirstPart:ss firstFont:14 firstColor:MLDrakGrayColor secondPart:self.item.startTime secondFont:13 secongColor:MLLightGrayColor space:2 align:0] forState:0];
    [self.dateEndButton setAttributedTitle:[NSString setFirstPart:ee firstFont:14 firstColor:MLDrakGrayColor secondPart:self.item.endTime secondFont:13 secongColor:MLLightGrayColor space:2 align:0] forState:0];
    self.durationLabel.text = self.item.duration;
    self.ddLabel.text = self.item.zuqi;
    
    
    //监听
    //开始日期改变情况
    [[[RACObserve(self.item, startMoments) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(id x) {
        
        self.startDa = x;
        
        NSString *firstPart = [x substringWithRange:NSMakeRange(0, 5)];
        NSString *secondPart = [x substringFromIndex:6];
        
        NSString *ss = [NSString stringWithFormat:@"%@\n",firstPart];
         [self.dateFromButton setAttributedTitle: [NSString setFirstPart:ss firstFont:14 firstColor:MLDrakGrayColor secondPart:secondPart secondFont:13 secongColor:MLLightGrayColor space:2 align:0] forState:0];
        
        if ([self.item.duration integerValue] <=0) {
            self.durationLabel.text = @"1天";
        }else{
            self.durationLabel.text = [NSString stringWithFormat:@"%@天",self.item.duration];
        }
    }];
    
    //结束日期改变情况
    [[[RACObserve(self.item, endMoments) skip:1] takeUntil:[self rac_prepareForReuseSignal]] subscribeNext:^(id x) {
        
        self.endDa = x;
        
        NSString *firstPart = [x substringWithRange:NSMakeRange(0, 5)];
        NSString *secondPart = [x substringFromIndex:6];

        NSString *ee = [NSString stringWithFormat:@"%@\n",firstPart];
        [self.dateEndButton setAttributedTitle:[NSString setFirstPart:ee firstFont:14 firstColor:MLDrakGrayColor secondPart:secondPart secondFont:13 secongColor:MLLightGrayColor space:2 align:0] forState:0];
      
        if ([self.item.duration integerValue] <=0) {
            self.durationLabel.text = @"1天";
        }else{
            self.durationLabel.text = [NSString stringWithFormat:@"%@天",self.item.duration];
        }
    }];
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
