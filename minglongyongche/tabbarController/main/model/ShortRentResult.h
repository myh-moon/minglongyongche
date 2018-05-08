//
//  ShortRentResult.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseModel.h"
#import "CarModel.h"

@interface ShortRentResult : BaseModel

@property (nonatomic,copy) NSMutableArray *lease;  //租车列表
@property (nonatomic,copy) NSString *totals;
@property (nonatomic,copy) NSString *page;
@property (nonatomic,copy) NSString *p;

//租车详情内的数据
@property (nonatomic,strong) CarModel *data;




@end
