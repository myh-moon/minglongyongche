//
//  CarFixedItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface CarFixedItem : RETableViewItem

//车的种类（短租，长租，婚车。。。）
@property (nonatomic,copy,readwrite) NSString *carType0;
@property (nonatomic,copy,readwrite) NSString *carType1;

@property (nonatomic,strong) void (^didClickCarType)(NSInteger tag);


@end
