//
//  CarDetailTimeCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "TimeButton.h"
//#import "CarListItem.h"
#import "CarDetailTimeItem.h"

@interface CarDetailTimeCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) TimeButton *toDayButton;  //今天
@property (nonatomic,strong) TimeButton *firstButton;  //过后第一天
@property (nonatomic,strong) TimeButton *secondButton;  //过后第二天
@property (nonatomic,strong) TimeButton *thirdButton;  ////过后第三天
@property (nonatomic,strong) TimeButton *fourthButton;  ////过后第四天
@property (nonatomic,strong) TimeButton *fifthButton;  ////过后第五天
@property (nonatomic,strong) TimeButton *sixthButton;  ////过后第六天

@property (nonatomic,strong) UIButton *noteBtn1;  //全天可租
@property (nonatomic,strong) UIButton *noteBtn2;  //不可租

@property (nonatomic,strong,readwrite) CarDetailTimeItem *item; 

@end
