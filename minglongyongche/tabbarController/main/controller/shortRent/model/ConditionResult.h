//
//  ConditionResult.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseModel.h"

@interface ConditionResult : BaseModel

@property (nonatomic,strong) NSMutableArray *types;  //条件 (类型，租金，品牌都是array)

@end
