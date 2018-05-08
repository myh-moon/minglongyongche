//
//  TicketItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "TicketModel.h"

@interface TicketItem : RETableViewItem

@property (nonatomic,copy) NSString *note;


@property (nonatomic,readwrite,copy) NSString *overdueTime;  //过期时间
@property (nonatomic,readwrite,copy) NSString *validDays; //有效期

@property (nonatomic,copy) NSString *tid;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *info;
//@property (nonatomic,copy) NSString *stime;
//@property (nonatomic,copy) NSString *etime;
@property (nonatomic,copy) NSString *money;

@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *sourceDetail1;
@property (nonatomic,copy) NSString *sourceDetail2;



@property (nonatomic,assign) BOOL isValid;  //是否有效


- (instancetype) initWithTicketModel:(TicketModel *)model;

- (instancetype) initWithOrderTicketModel:(TicketModel *)model validStartTime:(NSDate *)start validEndTime:(NSDate *)end;


@end
