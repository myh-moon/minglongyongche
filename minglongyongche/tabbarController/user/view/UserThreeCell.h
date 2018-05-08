//
//  UserThreeCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "IntegrationButton.h"
#import "UserAccountItem.h"

@interface UserThreeCell : BaseCell

@property (nonatomic,strong) IntegrationButton *ticketBtn;
@property (nonatomic,strong) IntegrationButton *accountBtn;
@property (nonatomic,strong) IntegrationButton *wordBtn;

@property (nonatomic,strong,readwrite) UserAccountItem *item;

@end
