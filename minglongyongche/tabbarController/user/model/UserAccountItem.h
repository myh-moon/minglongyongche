//
//  UserAccountItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "UserItem.h"

@interface UserAccountItem : UserItem

@property (nonatomic,copy,readwrite) NSString *ticket;  //优惠券
@property (nonatomic,copy,readwrite) NSString *account;//账户余额
@property (nonatomic,copy,readwrite) NSString *exchangeWord; // 兑换口令

@property (nonatomic,strong) void (^didClickBtn) (NSInteger tag);


@end
