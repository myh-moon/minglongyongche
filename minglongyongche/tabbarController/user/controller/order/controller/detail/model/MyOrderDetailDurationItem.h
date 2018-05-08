//
//  MyOrderDetailDurationItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "CarModel.h"

@interface MyOrderDetailDurationItem : RETableViewItem

@property (nonatomic,copy) NSString *starttime;
@property (nonatomic,copy) NSString *endtime;
@property (nonatomic,copy) NSString *duration;

- (instancetype) initWithStartTime:(NSString *)start endTime:(NSString *)end;

@end
