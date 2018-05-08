//
//  LoginCodeItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/19.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"

@interface LoginCodeItem : BaseItem

@property (nonatomic,strong) void (^didChangeText)(NSString *text);

@end
