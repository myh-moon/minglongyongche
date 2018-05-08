//
//  PullDatePickerView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PullDatePickerView.h"

@implementation PullDatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
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

                NSArray *weekdayAry = [NSArray arrayWithObjects:@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
                [formatter  setShortWeekdaySymbols:weekdayAry];
//                [formatter setDateFormat:@"yyyy年eee"];
                //设置时间格式
                formatter.dateFormat = @"MM-dd eee H:mm";
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
        _datePicker.minimumDate = [NSDate date];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        
    }
    return _datePicker;
}

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    UIView *hitView = [super hitTest:point withEvent:event];
//    // 此时hitView是已经检测出的hit-view了,是self or subViews(hitted subView)
//
//    /* 注意：
//     * 如果想要阻断触摸事件传递给subView，下面的2种做法是不太合理的：
//     */
//
//    /* 方法1：
//     * 不管3721的直接返回self也是不对的，因为当没有点击在self上(包括它的subView)的时候，self都成了hit-view
//     */
//
//    NSLog(@"%@",hitView);
//
//    return hitView;
//}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
