//
//  MyOrderDetailNumberCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailNumberItem.h"

@interface MyOrderDetailNumberCell : BaseCell

//@property (nonatomic,strong) UILabel *infoLabel;
@property (nonatomic,strong) UILabel *numberLabel1;
@property (nonatomic,strong) UILabel *numberLabel2;

@property (nonatomic,strong,readwrite) MyOrderDetailNumberItem *item;

@end
