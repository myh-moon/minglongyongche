//
//  CarDetailsViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"

@interface CarDetailsViewController : NetworkViewController

@property (nonatomic,strong) NSString *zid;

@property (nonatomic,strong) NSString *type;  //短租，长租，婚车等不同的类型

@end
