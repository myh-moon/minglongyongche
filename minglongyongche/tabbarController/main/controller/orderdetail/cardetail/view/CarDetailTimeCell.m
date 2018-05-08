//
//  CarDetailTimeCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarDetailTimeCell.h"

@implementation CarDetailTimeCell

//@dynamic item;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 150;
}

- (void)cellDidLoad {
    [self.contentView addSubview:self.toDayButton];
    [self.contentView addSubview:self.firstButton];
    [self.contentView addSubview:self.secondButton];
    [self.contentView addSubview:self.thirdButton];
    [self.contentView addSubview:self.fourthButton];
    [self.contentView addSubview:self.fifthButton];
    [self.contentView addSubview:self.sixthButton];
    
    [self.contentView addSubview:self.noteBtn1];
    [self.contentView addSubview:self.noteBtn2];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.toDayButton,self.firstButton,self.secondButton,self.thirdButton,self.fourthButton,self.fifthButton,self.sixthButton];
        
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:5 insetSpacing:YES];
        [views autoSetViewsDimension:ALDimensionHeight toSize:self.contentView.frame.size.height-40];
        
        
        
        [self.noteBtn2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
        [self.noteBtn2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
        
        [self.noteBtn1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.noteBtn2];
        [self.noteBtn1 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.noteBtn2 withOffset:-20];
    
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (TimeButton *)toDayButton {
    if (!_toDayButton) {
        _toDayButton = [TimeButton newAutoLayoutView];
    }
    return _toDayButton;
}

- (TimeButton *)firstButton {
    if (!_firstButton) {
        _firstButton = [TimeButton newAutoLayoutView];
    }
    return _firstButton;
}

- (TimeButton *)secondButton {
    if (!_secondButton) {
        _secondButton = [TimeButton newAutoLayoutView];
    }
    return _secondButton;
}

- (TimeButton *)thirdButton {
    if (!_thirdButton) {
        _thirdButton = [TimeButton newAutoLayoutView];
    }
    return _thirdButton;
}

- (TimeButton *)fourthButton {
    if (!_fourthButton) {
        _fourthButton = [TimeButton newAutoLayoutView];
    }
    return _fourthButton;
}

- (TimeButton *)fifthButton {
    if (!_fifthButton) {
        _fifthButton = [TimeButton newAutoLayoutView];
    }
    return _fifthButton;
}

- (TimeButton *)sixthButton {
    if (!_sixthButton) {
        _sixthButton = [TimeButton newAutoLayoutView];
    }
    return _sixthButton;
}

- (UIButton *)noteBtn1 {
    if (!_noteBtn1) {
        _noteBtn1 = [UIButton newAutoLayoutView];
        [_noteBtn1 setTitle:@"全天可租" forState:0];
        [_noteBtn1 setTitleColor:MLLightGrayColor forState:0];
        _noteBtn1.titleLabel.font = MLFont3;
    }
    return _noteBtn1;
}

- (UIButton *)noteBtn2 {
    if (!_noteBtn2) {
        _noteBtn2  = [UIButton newAutoLayoutView];
        [_noteBtn2 setTitleColor:MLLightGrayColor forState:0];
        [_noteBtn2 setTitle:@"不可租" forState:0];
        _noteBtn2.titleLabel.font = MLFont3;
    }
    return _noteBtn2;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    self.toDayButton.dateLabel.text = @"一";
//    [self.toDayButton.dateBtn setTitle:@"今" forState:0];
//    self.toDayButton.priceLabel.text = @"200/天";
//    
//    self.firstButton.dateLabel.text = @"二";
//    [self.firstButton.dateBtn setTitle:@"今" forState:0];
//    self.firstButton.priceLabel.text = @"200/天";
//    
//    self.secondButton.dateLabel.text = @"三";
//    [self.secondButton.dateBtn setTitle:@"今" forState:0];
//    self.secondButton.priceLabel.text = @"200/天";
//    
//    self.thirdButton.dateLabel.text = @"四";
//    [self.thirdButton.dateBtn setTitle:@"今" forState:0];
//    self.thirdButton.priceLabel.text = @"200/天";
//    
//    self.fourthButton.dateLabel.text = @"五";
//    [self.fourthButton.dateBtn setTitle:@"今" forState:0];
//    self.fourthButton.priceLabel.text = @"200/天";
//    
//    self.fifthButton.dateLabel.text = @"六";
//    [self.fifthButton.dateBtn setTitle:@"今" forState:0];
//    self.fifthButton.priceLabel.text = @"200/天";
//    
//    self.sixthButton.dateLabel.text = @"日";
//    [self.sixthButton.dateBtn setTitle:@"今" forState:0];
//    self.sixthButton.priceLabel.text = @"200/天";
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
