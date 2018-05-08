//
//  BaseBottomView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseBottomView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@property (nonatomic,assign) float multiple;

@end
