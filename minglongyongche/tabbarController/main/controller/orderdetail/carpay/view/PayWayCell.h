//
//  PayWayCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "BaseItem.h"

@interface PayWayCell : BaseCell

@property (nonatomic,strong) UILabel *redLabel;
@property (nonatomic,strong) UILabel *wayLabel;

@property (nonatomic,strong,readwrite) BaseItem *item;

@end
