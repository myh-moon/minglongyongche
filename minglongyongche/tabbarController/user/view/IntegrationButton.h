//
//  IntegrationButton.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/18.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntegrationButton : UIButton

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIImageView *btnImageView;
@property (nonatomic,strong) UILabel *btnLabel;


@property (nonatomic,strong) NSLayoutConstraint *spaceConstraints;

@end
