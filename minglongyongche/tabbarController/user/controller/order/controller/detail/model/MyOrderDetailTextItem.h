//
//  MyOrderDetailTextItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

//#import "BaseItem.h"
//#import "CarOrderModel.h"
#import "MyOrderDetailResponse.h"

@interface MyOrderDetailTextItem : RETableViewItem

@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *license;
@property (nonatomic,copy) NSString *feature1;
@property (nonatomic,copy) NSString *feature2;

- (instancetype) initWithModel:(MyOrderDetailResponse *)model;

@end
