//
//  BaseItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface BaseItem : RETableViewItem

@property (nonatomic,copy) NSString *titleImageString;
@property (nonatomic,copy) NSString *firstTitleString;
@property (nonatomic,copy) NSString *secondTextString;

- (instancetype) initWithTitle:(NSString *)firstString firstImage:(NSString *)imgString secondText:(NSString *)secondString;

- (instancetype) initWithTitle:(NSString *)firstString firstImage:(NSString *)imgString;

@property (nonatomic,strong) void (^didSelectedBtn)(NSInteger tag);

@end
