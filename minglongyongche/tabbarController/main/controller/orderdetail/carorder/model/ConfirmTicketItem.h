//
//  ConfirmTicketItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/28.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"

@interface ConfirmTicketItem : BaseItem

@property (nonatomic,copy) NSString *tid;

@property (nonatomic,strong) void (^didSelectedText)(UIButton *btn);


@end
