//
//  OrderCommitViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OrderCommitViewController.h"
#import "OrderPayViewController.h"
#import "AddAddressViewController.h"
#import "OrderTicketViewController.h"

#import "ConfirmBottomView.h"

#import "CarOrderItem.h"
#import "WordItem.h"

#import "SeperateItem.h"
#import "ConfirmPhoneItem.h"
#import "ConfirmDateItem.h"
#import "ConfirmMessageItem.h"
#import "BaseItem.h"
#import "CommonItem.h"
#import "ConfirmCostItem.h"
#import "ConfirmTicketItem.h"


#import "PreOrderModel.h"
#import "WechatModel.h"

@interface OrderCommitViewController ()<RETableViewManagerDelegate,UIActionSheetDelegate>

@property (nonatomic,strong) UITableView *carDetailTableView;
@property (nonatomic,strong) ConfirmBottomView *payBottomView;

@property (nonatomic,strong) RETableViewManager *manager;

@property (nonatomic,strong) NSMutableDictionary *orderDic;

@property (nonatomic,strong) NSDate *startMoment;
@property (nonatomic,strong) NSDate *endMoment;

@end

@implementation OrderCommitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"确认订单";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    [self.view addSubview:self.carDetailTableView];
    [self.view addSubview:self.payBottomView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.carDetailTableView];
//
    self.manager[@"SeperateItem"] = @"SeperateCell";
    self.manager[@"ConfirmPhoneItem"] = @"ConfirmPhoneCell";
    self.manager[@"ConfirmDateItem"] = @"ConfirmDateCell";
    self.manager[@"BaseItem"] = @"PayWayCell";
    self.manager[@"ConfirmMessageItem"] = @"ConfirmMessageCell";
    self.manager[@"CommonItem"] = @"CommonDoubleCell";
    self.manager[@"ConfirmCostItem"] = @"ConfirmCostCell";
    self.manager[@"ConfirmTicketItem"] = @"ConfirmTicketCell";
    
    [self setupDetailTableView];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.carDetailTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [self.carDetailTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.payBottomView];
        
        [self.payBottomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.payBottomView autoSetDimension:ALDimensionHeight toSize:60];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)carDetailTableView {
    if (!_carDetailTableView) {
        _carDetailTableView = [UITableView newAutoLayoutView];
        _carDetailTableView.tableFooterView = [UIView new];
    }
    return _carDetailTableView;
}

- (ConfirmBottomView *)payBottomView {
    if (!_payBottomView) {
        _payBottomView = [ConfirmBottomView newAutoLayoutView];
//        [_payBottomView.leftButton setTitle:@"实收款" forState:0];
        
        MLWeakSelf;
        [_payBottomView.rightButton addAction:^(UIButton *btn) {
                [weakself generatePreOrder];
        }];
    }
    return _payBottomView;
}

- (void)setupDetailTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    MLWeakSelf;
//    //联系方式
//    ConfirmPhoneItem *item0 = [[ConfirmPhoneItem alloc] initWithLeftTitle:@"phone" leftImage:@"add_address" leftTextColor:MLBlackColor leftTextFont:15 rightImage:@"arrow_right" hidden:NO];
//    item0.cellHeight = 80;
//    item0.selectionStyle = UITableViewCellSelectionStyleNone;
//    item0.selectionHandler = ^(id item) {
//        AddAddressViewController *addAddressVC = [[AddAddressViewController alloc] init];
//        [weakself.navigationController pushViewController:addAddressVC animated:YES];
//    };
//    [section addItem:item0];
    
//    SeperateItem *item00 = [[SeperateItem alloc] init];
//    item00.cellHeight = smallSpacing;
//    item00.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:item00];

    
    SeperateItem *item000 = [[SeperateItem alloc] init];
    item000.selectionStyle = UITableViewCellSelectionStyleNone;
    item000.cellHeight = smallSpacing;
    [section addItem:item000];
    
    //选择地址
    CommonItem *item1 = [[CommonItem alloc] initWithLeftText:@"取还车地址" rightText:self.carModel.address];
    item1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item1];
//    ConfirmPhoneItem *item1 = [[ConfirmPhoneItem alloc] initWithLeftTitle:@"选择取还车地址" leftImage:@"" leftTextColor:MLLightGrayColor leftTextFont:14 rightImage:@"play_arrow" hidden:YES];
//    item1.cellHeight = 45;
//    item1.selectionStyle = UITableViewCellSelectionStyleNone;
//    item1.selectionHandler = ^(id item) {
//        NSArray *address = @[self.carModel.address];
//        [weakself showBlurViewInView:weakself.view array:address finishBlock:^(NSString *name) {
//            [weakself showHint:name];
//            item1.leftTitle = name;
//        }];
//    };
//    [section addItem:item1];
    
    //租期
    ConfirmDateItem *item2 = [[ConfirmDateItem alloc] initWithStartDate:@"请选择" startTime:@"租车时间" endDate:@"请选择" endTime:@"还车时间" duration:@"" zuqi:@"租期"];
    item2.selectionStyle = UITableViewCellSelectionStyleNone;
    @weakify(item2);
    [item2 setDidSelectedBtn:^(NSInteger tag) {
        [weakself showPickerViewInView:weakself.view finishBlock:^(NSString *dateStr, NSDate *date) {
            @strongify(item2);
            
            if (tag == 45) {
                weakself.startMoment = date;
            }else if (tag == 46){
                weakself.endMoment = date;
            }
            
            //去掉时分秒信息(计算具体租期，按天算)
            NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDate *fromDate;
            NSDate *toDate;
            [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:weakself.startMoment];
            [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:weakself.endMoment];
            NSDateComponents *dayComponents = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
            
            item2.duration = [NSString stringWithFormat:@"%ld",(long)dayComponents.day];
            item2.zuqi = @"租期";
            
            NSString *firstPart = [dateStr substringWithRange:NSMakeRange(0, 5)];
            NSString *secondPart = [dateStr substringFromIndex:6];
            if (tag == 45) {
                item2.startMoments = dateStr;
                item2.startDate = firstPart;
                item2.startTime = secondPart;
                
                //参数重组
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                //设置时间格式
                formatter.dateFormat = @"yyyy-MM-dd H:mm";
                NSString *asasa = [formatter  stringFromDate:date];
                [self.orderDic setValue:asasa forKey:@"qctime"];
                
            }else if (tag == 46){
                item2.endMoments = dateStr;
                item2.endDate = firstPart;
                item2.endTime = secondPart;
                //参数重组
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                //设置时间格式
                formatter.dateFormat = @"yyyy-MM-dd H:mm";
                NSString *asasa = [formatter  stringFromDate:date];
                [self.orderDic setValue:asasa forKey:@"hctime"];
            }
            
        }];
    }];
    [section addItem:item2];
    
    SeperateItem *item22 = [[SeperateItem alloc] init];
    item22.selectionStyle = UITableViewCellSelectionStyleNone;
    item22.cellHeight = smallSpacing;
    [section addItem:item22];
  
    //订单信息
    BaseItem *item33 = [[BaseItem alloc]initWithTitle:@"订单信息" firstImage:@""];
    item1.selectionStyle = UITableViewCellSelectionStyleNone;
    item33.cellHeight = 35;
    [section addItem:item33];
    
    ConfirmMessageItem *item3 = [[ConfirmMessageItem alloc] initWithModel:self.carModel];
    item3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item3];
    
    SeperateItem *item333 = [[SeperateItem alloc] init];
    item333.cellHeight = smallSpacing;
    [section addItem:item333];
    
    CommonItem*item4 = [[CommonItem alloc] initWithLeftText:@"每日租赁费用*天数" rightText:@""];
    item4.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item4];
    
//    CommonItem*item5 = [[CommonItem alloc] initWithLeftText:@"基本保险服务费用 ¥30/天" rightText:@""];
//    item5.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:item5];
    


    CommonItem*item6 = [[CommonItem alloc] initWithLeftText:@"取车方式" rightText:@"到店自取"];
    item6.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item6];

    NSString *yajin = [NSString stringWithFormat:@"用车押金  ¥%@",self.carModel.ymoney];
    CommonItem*item7 = [[CommonItem alloc] initWithLeftText:yajin rightText:@"取车时预收"];
    item7.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item7];
    
    //优惠券
    ConfirmTicketItem *item8 = [[ConfirmTicketItem alloc] init];
    item8.secondTextString = @"";
    item8.selectionStyle = UITableViewCellSelectionStyleNone;

    @weakify(item8);
    item8.selectionHandler = ^(id item) {
        
        if ([item2.duration integerValue] >= 1) {
            OrderTicketViewController *orderTicketVC = [[OrderTicketViewController alloc] init];
            orderTicketVC.starttime = weakself.startMoment;
            orderTicketVC.endtime = weakself.endMoment;
            orderTicketVC.didSelectedTicket = ^(TicketModel *model) {
                @strongify(item8);
                //1.文字改变
                item8.secondTextString = [NSString stringWithFormat:@"¥%@",model.money];
                item8.tid = model.tid;
                
                //2.参数改变
                [weakself.orderDic setValue:model.tid forKey:@"tid"];
                
            };
            [weakself.navigationController pushViewController:orderTicketVC animated:YES];
        }else {
            [weakself showHint:@"请先选择租期"];
        }
        
    };
    [section addItem:item8];
    
    //合计费用
    ConfirmCostItem *item10 = [[ConfirmCostItem alloc] init];
    item10.costMoney = @"0.00";
    item10.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item10];
    
    
//优惠券的选择，天数的改变，，都会引起总价的变化
    RACSignal *ticketSignal = [RACSignal combineLatest:@[RACObserve(item8, secondTextString),RACObserve(item8, tid),RACObserve(item2, duration)] reduce:^id(NSString *money,NSString *tid,NSString *duration){
        
        if ([duration integerValue] >= 1) {
            double zulin = [self.carModel.money floatValue]*[duration integerValue];
            //租赁费
            item4.rightStr = [NSString stringWithFormat:@"%@*%@ = ¥%.2f",self.carModel.money,duration,zulin];
            
            //总价
            if(money.length >= 1){
                
                double sssss = [[money substringFromIndex:1] doubleValue];
                
                item10.costMoney = [NSString stringWithFormat:@"%.2f",zulin - sssss];
                
            }else{
                item10.costMoney = [NSString stringWithFormat:@"%.2f",zulin];
            }
            
            [self.orderDic setValue:item10.costMoney forKey:@"money"];
            
            NSString *sfsf = [NSString stringWithFormat:@"¥%@",item10.costMoney];
            
            [weakself.payBottomView.leftButton setAttributedTitle:[NSString setFirstPart:@"还需付款：" firstFont:13 firstColor:MLDrakGrayColor secondPart:sfsf secondFont:16 secongColor:MLOrangeColor] forState:0];
        }
        
        return @"12";
    }];
    
    [ticketSignal subscribeNext:^(id x) {
        
    }];
}

//预支付
- (void) generatePreOrder {
    NSString *generateStr = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLOrderOfGenerate,TOKEN];
    
    //时间
    NSDate *date = [NSDate date];
    long int timeSp = (long)[date timeIntervalSince1970];
    NSString *nowStr = [NSString stringWithFormat:@"%ld",timeSp];
    
    [self.orderDic setValue:self.carModel.uid forKey:@"uid"];
    [self.orderDic setValue:self.carModel.zid forKey:@"aid"];
    [self.orderDic setValue:self.carModel.address forKey:@"qcaddress"];
    [self.orderDic setValue:self.carModel.address forKey:@"hcaddress"];
    [self.orderDic setValue:self.carModel.ymoney forKey:@"ymoney"];
    [self.orderDic setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"phone"] forKey:@"phone"];
    
//    [self.orderDic setValue:@"2018-05-01 12:00" forKey:@"qctime"];
//    [self.orderDic setValue:@"2018-05-10 16:00" forKey:@"hctime"];
    
    [self.orderDic setValue:@"0" forKey:@"status"];
    [self.orderDic setValue:nowStr forKey:@"addtime"];
    [self.orderDic setValue:@"1" forKey:@"type"];
    
    if (!self.orderDic[@"tid"]) {
        [self.orderDic setValue:@"0" forKey:@"tid"];
    }
    
    MLWeakSelf;
    [self requestDataPostWithString:generateStr params:self.orderDic successBlock:^(id responseObject) {
        PreOrderModel *model = [PreOrderModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
        
        if ([model.status isEqualToString:@"200"]) {
            OrderPayViewController *orderPayVC = [[OrderPayViewController alloc] init];
//            orderPayVC.oid = model.oid;
//            orderPayVC.money = model.money;
            orderPayVC.preOrderModel = model;
            [weakself.navigationController pushViewController:orderPayVC animated:YES];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (NSMutableDictionary *)orderDic {
    if (!_orderDic) {
        _orderDic = [NSMutableDictionary new];
    }
    return _orderDic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
