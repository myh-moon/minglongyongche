//
//  ConditionModel.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConditionModel : NSObject

@property (nonatomic,copy) NSString *pid;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *admin_id;
@property (nonatomic,copy) NSString *add_time;
@property (nonatomic,strong) NSMutableArray *child;


@end
