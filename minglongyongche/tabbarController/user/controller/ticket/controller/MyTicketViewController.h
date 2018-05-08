//
//  MyTicketViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"
#import "TicketModel.h"

@interface MyTicketViewController : NetworkViewController

@property (nonatomic,copy) NSString *direction;  //1-详情进入。2-我的，进入

@property (nonatomic,strong) void (^didSelectedTicket)(TicketModel *model);

@end
