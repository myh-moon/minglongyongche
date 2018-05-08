//
//  AuthenPhotoCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "AuthenPhotoItem.h"

@interface AuthenPhotoCell : BaseCell

@property (nonatomic,strong) UIButton *photoButton;

@property (nonatomic,strong,readwrite) AuthenPhotoItem *item;

@end
