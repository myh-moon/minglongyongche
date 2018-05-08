//
//  AuthenCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "AuthenItem.h"

@interface AuthenCell : BaseCell

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UITextField *messageTextField;

@property (nonatomic,strong,readwrite) AuthenItem *item;


@end
