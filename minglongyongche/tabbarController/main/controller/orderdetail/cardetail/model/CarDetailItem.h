//
//  CarDetailItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/17.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"
#import "CarModel.h"

@interface CarDetailItem : BaseItem

@property (nonatomic,copy,readwrite) NSString *name; //车名
@property (nonatomic,copy,readwrite) NSString *mname;
@property (nonatomic,copy,readwrite) NSString *belong; //牌照
@property (nonatomic,copy,readwrite) NSString *money; //价格
@property (nonatomic,copy,readwrite) NSString *address; //车所在地址
@property (nonatomic,copy,readwrite) NSString *count;  //已租次数

@property (nonatomic,copy) NSString *site;   //车座个数
@property (nonatomic,copy) NSString *gate;   //车门数
@property (nonatomic,copy) NSString *grade;   //燃油型号  l 油箱容量
@property (nonatomic,copy) NSString *type;   //汽油
@property (nonatomic,copy) NSString *box; //音箱数
@property (nonatomic,copy) NSString *reverse; //倒车雷达
@property (nonatomic,copy) NSString *air; //气囊个数
@property (nonatomic,copy) NSString *curtain; //气帘个数
@property (nonatomic,copy) NSString *gps;   // GPS导航

@property (nonatomic,strong) NSMutableArray *configArray;


- (instancetype) initWithCarDetaiModel:(CarModel *)model;

@end
