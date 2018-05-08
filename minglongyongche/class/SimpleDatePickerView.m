//
//  SimpleDatePickerView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/28.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "SimpleDatePickerView.h"

@implementation SimpleDatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.dateStatus = [NSString string];
        
        [self addSubview:self.datePicker];
        [self addSubview:self.okButton];
        
        [self setNeedsUpdateConstraints];
        
    }
    
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.datePicker autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        [self.datePicker autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        [self.datePicker autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        [self.datePicker autoSetDimension:ALDimensionHeight toSize:200];
        
        [self.okButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];
        [self.okButton autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        [self.okButton autoSetDimension:ALDimensionHeight toSize:50];
        [self.okButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.datePicker];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UIButton *)okButton {
    if (!_okButton) {
        _okButton = [UIButton newAutoLayoutView];
        _okButton.backgroundColor = MLBackGroundColor;
        [_okButton setTitle:@"确定" forState:0];
        [_okButton setTitleColor:MLBlueColor forState:0];
        _okButton.titleLabel.font = MLFont;
        _okButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _okButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, middleSpacing);
        _okButton.userInteractionEnabled = YES;
        
        MLWeakSelf;
        [_okButton addAction:^(UIButton *btn) {
            
            if (weakself.didSelectedDate) {
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                
                //设置时间格式
                formatter.dateFormat = @"yyyy-MM-dd";
                NSString *dateStr = [formatter  stringFromDate:weakself.datePicker.date];
                weakself.didSelectedDate(dateStr,weakself.datePicker.date);
                
            }
        }];
    }
    return _okButton;
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [UIDatePicker newAutoLayoutView];
        _datePicker.backgroundColor = MLWhiteColor;
//        _datePicker.minimumDate = [NSDate date];
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }
    return _datePicker;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
