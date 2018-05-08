//
//  TimeButton.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeButton : UIButton

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UILabel *dateLabel;   //周一
@property (nonatomic,strong) UIButton *dateBtn;  //日期
@property (nonatomic,strong) UILabel *priceLabel;  //价格


@end
