//
//  PayResultViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MLTableViewController.h"

@interface PayResultViewController : MLTableViewController

@property (nonatomic,copy) NSString *oid; //该订单号

@property (nonatomic,copy)  NSString *payFlag; //支付结果1,2,3

@end
