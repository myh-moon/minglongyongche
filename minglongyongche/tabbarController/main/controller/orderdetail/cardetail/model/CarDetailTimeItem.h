//
//  CarDetailTimeItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarListItem.h"

@interface CarDetailTimeItem : CarListItem

//详情用到的字段
@property (nonatomic,copy,readwrite) NSString *site;   //车座个数
@property (nonatomic,copy,readwrite) NSString *gate;   //车门数
@property (nonatomic,copy,readwrite) NSString *grade;   //燃油型号  l 油箱容量
@property (nonatomic,copy,readwrite) NSString *box; //音箱数
@property (nonatomic,copy,readwrite) NSString *reverse; //倒车雷达
@property (nonatomic,copy,readwrite) NSString *air; //气囊个数
@property (nonatomic,strong,readwrite) NSString *curtain; //气帘个数
@property (nonatomic,strong,readwrite) NSString *gps;   // GPS导航

@end
