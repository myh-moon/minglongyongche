//
//  CarOrderItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface CarOrderItem : RETableViewItem

//生成订单页面
@property (copy,nonatomic) NSString *rentalCost;//车辆租赁费用
@property (copy,nonatomic)NSString *rentalCostTxt;
@property (copy,nonatomic)NSString *insuranceCost;//保险费用
@property (copy,nonatomic) NSString *insuranceCostTxt;
@property (copy,nonatomic) NSString *coupon;  //优惠券
@property (copy,nonatomic) NSString *couponTxt;

+ (instancetype) initWithTitle:(NSString *)title text:(NSString *)text;



@end
