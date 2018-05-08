//
//  MyOrderDetailBaseCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "BaseItem.h"

@interface MyOrderDetailBaseCell : BaseCell

@property (nonatomic,strong) UILabel *sssLabel;
@property (nonatomic,strong,readwrite) BaseItem *item;

@end
