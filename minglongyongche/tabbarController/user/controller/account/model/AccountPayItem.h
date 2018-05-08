//
//  AccountPayItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AccountItem.h"

@interface AccountPayItem : AccountItem

@property (nonatomic,copy) NSString *actStr;

- initWithAction:(NSString *)actionString;

@end
