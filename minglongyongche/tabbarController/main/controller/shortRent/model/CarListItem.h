//
//  CarListItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/3/30.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"
#import "CarModel.h"

@interface CarListItem : BaseItem

//短租列表
@property (nonatomic,strong) NSArray *imgArray;  //图片数组

@property (nonatomic,copy,readwrite) NSString *imageName;
@property (nonatomic,copy,readwrite) NSString *carName;
@property (nonatomic,copy,readwrite) NSString *carLicense;
@property (nonatomic,copy,readwrite) NSString *carPrice;
@property (nonatomic,copy,readwrite) NSString *carUsedDay;
@property (nonatomic,copy,readwrite) NSString *collocation;
//@property (nonatomic,copy) NSString *

//@property (no)

//短租详情
//@property (nonatomic,copy,readwrite) NSString *collocation; //豪华款


- (instancetype)initWIthModel:(CarModel *)model;



@end
