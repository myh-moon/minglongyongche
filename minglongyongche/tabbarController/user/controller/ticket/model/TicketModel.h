//
//  TicketModel.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicketModel : NSObject

@property (nonatomic,copy) NSString *money; //优惠金额
@property (nonatomic,copy) NSString *oid; //
@property (nonatomic,copy) NSString *status; //
@property (nonatomic,copy) NSString *tid; //优惠id
@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *stime;  //开始时间
@property (nonatomic,copy) NSString *etime;  //结束时间
@property (nonatomic,copy) NSString *usetime;  //使用时间
@property (nonatomic,copy) NSString *socre;
@property (nonatomic,copy) NSString *info;

@end
