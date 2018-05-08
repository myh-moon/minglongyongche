//
//  MyOrderDetailNumberItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface MyOrderDetailNumberItem : RETableViewItem

@property (nonatomic,copy) NSString *info;
@property (nonatomic,copy) NSString *detail;

- (instancetype) initWithInfo:(NSString *)info detailString:(NSString *)detailStr;

@end
