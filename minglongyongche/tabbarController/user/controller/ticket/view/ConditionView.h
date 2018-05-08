//
//  ConditionView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConditionView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *centerButton;
@property (nonatomic,strong) UIButton *rightButton;

@property (nonatomic,strong) UILabel *slideLabel;//滑动条

@property (nonatomic,strong) NSLayoutConstraint *leftConstarints;

@property (nonatomic,strong) void (^didChooseBtn)(NSInteger tag);


@end
