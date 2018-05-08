//
//  SimpleDatePickerView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/28.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleDatePickerView : UIView
@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIButton *okButton;
@property (nonatomic,strong) UIDatePicker *datePicker;

//@property (nonatomic,strong)  NSString *dateStatus;  //时间的类型
//@property (nonatomic,assign) NSInteger dataSta;

@property (nonatomic,strong) void (^didSelectedDate)(NSString *dateStr ,NSDate *date);


@end
