//
//  MyOrderDetailActionItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface MyOrderDetailActionItem : RETableViewItem

@property (nonatomic,copy) NSString *status;

@property (nonatomic,assign) NSInteger second; //剩余时间
@property (nonatomic,copy) NSString *countDownTimeString;//倒计时时间
//@property (nonatomic,copy) NSString *firstString;
//@property (nonatomic,copy) NSString *secondString;

@property (nonatomic,strong) void (^didSelectedAction)(NSString *acttionType);

- (instancetype) initWithMyOrderStatus:(NSString *)status countDownTime:(NSString *)time addTime:(NSString *)addtime;



@end
