//
//  MyOrderConditionView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderConditionView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *firstButton;  //全部
@property (nonatomic,strong) UIButton *secondButton;  //未付款
@property (nonatomic,strong) UIButton *thirdButton;  //进行中
@property (nonatomic,strong) UIButton *fourthButton;  //已完成


@property (nonatomic,strong) UILabel *slideLabel;//滑动条

@property (nonatomic,strong) NSLayoutConstraint *leftConstarints;

@property (nonatomic,strong) void (^didChooseBtn)(NSInteger tag);

@end
