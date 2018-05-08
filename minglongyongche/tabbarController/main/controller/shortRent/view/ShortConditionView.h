//
//  ShortConditionView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShortConditionView : UIView

//height:50

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIButton *typeBtn; // 类型选择
@property (nonatomic,strong) UIButton *rentBtn; //租金选择
@property (nonatomic,strong) UIButton *brandBtn; //品牌选择

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);


@end
