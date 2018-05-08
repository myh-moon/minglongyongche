//
//  LoginItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"

@interface LoginItem : BaseItem

@property (nonatomic,copy) NSString *phone;

@property (nonatomic,strong) void (^didChangeText)(NSString *text);

@end
