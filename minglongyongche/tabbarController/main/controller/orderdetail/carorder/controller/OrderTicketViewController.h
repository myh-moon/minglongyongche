//
//  OrderTicketViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MLRefreshTableViewController.h"
#import "TicketModel.h"

@interface OrderTicketViewController : MLRefreshTableViewController

@property (nonatomic,strong) NSDate *starttime;
@property (nonatomic,strong) NSDate *endtime;

@property (nonatomic,strong) void (^didSelectedTicket)(TicketModel *model);

@end
