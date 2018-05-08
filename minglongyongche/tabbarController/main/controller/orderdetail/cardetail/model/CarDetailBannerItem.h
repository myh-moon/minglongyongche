//
//  CarDetailBannerItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"
#import "CarModel.h"

@interface CarDetailBannerItem : BaseItem

@property (nonatomic,strong,readwrite) NSArray *imgArray;

- (instancetype) initWithCarModel:(CarModel *)model;

@end
