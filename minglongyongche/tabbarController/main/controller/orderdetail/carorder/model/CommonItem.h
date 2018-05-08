//
//  CommonItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface CommonItem : RETableViewItem

@property (nonatomic,copy) NSString *leftStr;
@property (nonatomic,copy) NSString *rightStr;

- (instancetype) initWithLeftText:(NSString *)leftString rightText:(NSString *)rightString;

@end
