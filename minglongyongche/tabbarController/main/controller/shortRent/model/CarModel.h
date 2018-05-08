//
//  CarModel.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/1.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseModel.h"

@interface CarModel : BaseModel

//短租列表用到的字段
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *uid;  //用户id
@property (nonatomic,copy) NSString *zid;
@property (nonatomic,copy) NSString *aid;  //车id
@property (nonatomic,copy) NSString *pic;  //图片
@property (nonatomic,strong) NSArray *picArr;  //图片
@property (nonatomic,copy) NSString *tid;  //优惠券id


@property (nonatomic,copy) NSString *name;  //车名字
@property (nonatomic,copy) NSString *money;   //价格
@property (nonatomic,copy) NSString *cmoney;
@property (nonatomic,copy) NSString *ymoney; //押金
@property (nonatomic,copy) NSString *count; //用车次数
//@property (nonatomic,copy) NSString *counts; //用车次数
@property (nonatomic,copy) NSString *belong; //牌照
@property (nonatomic,copy) NSString *address;  //地址

//详情用到的字段
@property (nonatomic,copy) NSString *mname;
@property (nonatomic,copy) NSString *sc;  //收藏字段

@property (nonatomic,copy) NSString *site;   //车座个数
@property (nonatomic,copy) NSString *gate;   //车门数
@property (nonatomic,copy) NSString *grade;   //燃油型号
@property (nonatomic,copy) NSString *l;  //l 油箱容量
@property (nonatomic,copy) NSString *box; //音箱数
@property (nonatomic,copy) NSString *reverse; //倒车雷达
@property (nonatomic,copy) NSString *air; //气囊个数
@property (nonatomic,copy) NSString *curtain; //气帘个数
@property (nonatomic,copy) NSString *GPS;   // GPS导航
@property (nonatomic,copy) NSString *collocation;
@property (nonatomic,copy) NSString *type; //汽油
@property (nonatomic,copy) NSString *win;  //天窗
@property (nonatomic,copy) NSString *output;  //排量
@property (nonatomic,copy) NSString *is_t_l; //发动机
@property (nonatomic,copy) NSString *actuation;  //驱动
@property (nonatomic,copy) NSString *seat;  //座椅面料


@property (nonatomic,copy) NSString *coid;  //收藏id
@property (nonatomic,copy) NSString *oid;  //订单id



//订单
@property (nonatomic,copy) NSString *qctime;
@property (nonatomic,copy) NSString *qcaddress;
@property (nonatomic,copy) NSString *hcaddress;
@property (nonatomic,copy) NSString *hctime;
@property (nonatomic,copy) NSString *statuss; //还车状态0，1，2



//我的订单详情
//@property (nonatomic,copy) NSString *aid;  //车id
//@property (nonatomic,copy) NSString *cmoney;
//@property (nonatomic,copy) NSString *qcaddress;
//@property (nonatomic,copy) NSString *hcaddress;
//@property (nonatomic,copy) NSString *qctime;
//@property (nonatomic,copy) NSString *hctime;
//@property (nonatomic,copy) NSString *oid;  //订单id
//@property (nonatomic,copy) NSString *tid;  //优惠券id
//@property (nonatomic,copy) NSString *ymoney; //押金
//@property (nonatomic,copy) NSString *uid;  //用户id
@property (nonatomic,copy) NSString *is_auto;
@property (nonatomic,copy) NSString *addtime; //下单时间
//@property (nonatomic,copy) NSString *site;   //车座个数
@property (nonatomic,copy) NSString *times;   //倒计时

@end
