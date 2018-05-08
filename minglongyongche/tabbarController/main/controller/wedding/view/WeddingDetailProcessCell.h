//
//  WeddingDetailProcessCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "CarFixedItem.h"

@interface WeddingDetailProcessCell : BaseCell

@property (nonatomic,strong) UIButton *processButton1;
@property (nonatomic,strong) UIButton *processButton2;
@property (nonatomic,strong) UIButton *processButton3;
@property (nonatomic,strong) UIButton *processButton4;
@property (nonatomic,strong) UIButton *arrow1;
@property (nonatomic,strong) UIButton *arrow2;
@property (nonatomic,strong) UIButton *arrow3;

@property (nonatomic,strong,readwrite) CarFixedItem *item;

@end
