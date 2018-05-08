//
//  MyOrderDetailProcessCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "MyOrderDetailProcessItem.h"

@interface MyOrderDetailProcessCell : BaseCell

@property (nonatomic,strong) UILabel *carStatusLabel;

@property (nonatomic,strong) UIButton *processImageButton1;
@property (nonatomic,strong) UIButton *processImageButton2;
@property (nonatomic,strong) UIButton *processImageButton3;
@property (nonatomic,strong) UIButton *processImageButton4;

@property (nonatomic,strong) UILabel *processLabel1;
@property (nonatomic,strong) UILabel *processLabel2;
@property (nonatomic,strong) UILabel *processLabel3;
@property (nonatomic,strong) UILabel *processLabel4;

@property (nonatomic,strong) UIImageView *lineImageView1;
@property (nonatomic,strong) UIImageView *lineImageView2;
@property (nonatomic,strong) UIImageView *lineImageView3;

@property (nonatomic,strong,readwrite) MyOrderDetailProcessItem *item;

@end
