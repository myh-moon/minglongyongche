//
//  CarDetailItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/17.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarDetailItem.h"

@implementation CarDetailItem

- (instancetype)initWithCarDetaiModel:(CarModel *)model {
    self = [super init];
    
    if (self) {
        self.name = model.name;
        self.mname =  model.mname;
        
        if ([model.belong isEqualToString:@"1"]) {
            self.belong = @"沪";
        }else{
            self.belong = model.belong;
        }
        
        self.money= model.money;
        self.address = model.address;
        self.count = model.count;
        
        
        self.site = [NSString stringWithFormat:@"%@个座椅",model.site];
        self.gate = [NSString stringWithFormat:@"%@个车门",model.gate];
        self.grade = model.grade;
        self.box = [NSString stringWithFormat:@"%@个音箱",model.box];
        self.reverse = model.reverse;
        self.air = [NSString stringWithFormat:@"%@个气囊",model.air];
        self.curtain = model.curtain;
        self.gps = model.GPS;
        self.type = model.type;
        
//        @property (nonatomic,copy) NSString *site;   //车座个数
//        @property (nonatomic,copy) NSString *gate;   //车门数
//        @property (nonatomic,copy) NSString *grade;   //燃油型号  l 油箱容量
//        @property (nonatomic,copy) NSString *box; //音箱数
//        @property (nonatomic,copy) NSString *reverse; //倒车雷达
//        @property (nonatomic,copy) NSString *air; //气囊个数
//        @property (nonatomic,strong) NSString *curtain; //气帘个数
//        @property (nonatomic,strong) NSString *gps;   // GPS导航
        
        self.configArray = [NSMutableArray array];
        
        //变速箱AT
//        NSString *grase = [NSString stringWithFormat:@"%@号%@",model.grade,model.type];
//        [self.configArray addObject:@"变速箱AT"];
        
        //汽油
        NSString *grase = [NSString stringWithFormat:@"%@号%@",model.grade,model.type];
        [self.configArray addObject:grase];
        
        //油箱容积
        NSString *lll = [NSString stringWithFormat:@"油箱容积%@L",model.l];
        [self.configArray addObject:lll];
        
        
        //倒车雷达
        NSString *qwqw = [NSString stringWithFormat:@"%@倒车雷达",model.reverse];
        [self.configArray addObject:qwqw];
        
        //远程钥匙

        //气囊
        NSString *airr = [NSString stringWithFormat:@"%@个气囊",model.air];
        [self.configArray addObject:airr];
        
        //天窗
         [self.configArray addObject:model.win];
        
        //发动机
        [self.configArray addObject:model.is_t_l];

        //排量
        NSString *output = [NSString stringWithFormat:@"排量%@",model.output];
        [self.configArray addObject:output];
        
        //驱动方式
        [self.configArray addObject:model.actuation];

        //车门
        NSString *gates = [NSString stringWithFormat:@"%@个车门",model.gate];
        [self.configArray addObject:gates];
        
        //车座
        NSString *sites = [NSString stringWithFormat:@"%@个座位",model.site];
        [self.configArray addObject:sites];
        
        //GPS
        NSString *gpss = [NSString stringWithFormat:@"%@GPS导航",model.GPS];
        [self.configArray addObject:gpss];
        
        //座椅面料
        [self.configArray addObject: model.seat];
        
        //音箱数
        NSString *boxs = [NSString stringWithFormat:@"%@个音箱",model.box];
        [self.configArray addObject:boxs];
        
        //气帘
        NSString *cur = [NSString stringWithFormat:@"%@个气帘",model.curtain];
        [self.configArray addObject:cur];
        
    }
    return self;
}

@end
