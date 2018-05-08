//
//  NewsCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "NewsTypeItem.h"

@interface NewsCell : BaseCell

@property (nonatomic,strong) UIButton *titleButton;
@property (nonatomic,strong) UIButton *textButton;

@property (nonatomic,strong,readwrite) NewsTypeItem *item;

@end
