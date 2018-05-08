//
//  BaseViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UIViewController

@property (nonatomic,strong) UIBarButtonItem *leftBarItem; //返回键
@property (nonatomic,strong) UIButton *leftNavBtn;
@property (nonatomic,strong) UIButton *rightNavBtn;

@property (nonatomic,strong) UIButton *remindImageButton;  //当数据为空时，显示的提示图片

@property (nonatomic,assign) BOOL didSetupConstraints;

- (void) showRemindImage;
- (void)hiddenRemindImage;

@end
