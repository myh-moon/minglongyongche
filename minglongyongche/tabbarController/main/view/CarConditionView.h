//
//  CarConditionView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarConditionView : UIView

//height:50

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIButton *comprehensiveBtn;  //综合选择
@property (nonatomic,strong) UIButton *typeBtn; // 类型选择
@property (nonatomic,strong) UIButton *rentBtn; //租金选择
@property (nonatomic,strong) UIButton *brandBtn; //品牌选择

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@end
