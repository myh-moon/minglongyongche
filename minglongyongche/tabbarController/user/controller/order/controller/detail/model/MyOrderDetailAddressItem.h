//
//  MyOrderDetailAddressItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface MyOrderDetailAddressItem : RETableViewItem

@property (nonatomic,copy) NSString *qcaddress; //取车地址

- (instancetype) initWithOrderAddress:(NSString *)address;

@end
