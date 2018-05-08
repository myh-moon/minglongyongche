//
//  DetailOrderView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntegrationButton.h"

@interface DetailOrderView : UIView


@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) IntegrationButton *collectionButton;
@property (nonatomic,strong) UIButton *orderButton;

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);
@end
