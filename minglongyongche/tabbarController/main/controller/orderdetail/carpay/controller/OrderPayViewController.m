//
//  OrderPayViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OrderPayViewController.h"
#import "PayResultViewController.h"
#import <WXApi.h>

#import "SeperateItem.h"
#import "ConfirmMessageItem.h"
#import "PayMoneyItem.h"
#import "BaseItem.h"
#import "TicketItem.h"
#import "ConfirmDateItem.h"

#import "WechatModel.h"

@interface OrderPayViewController ()

@end

@implementation OrderPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单支付";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    self.manager  = [[RETableViewManager alloc] initWithTableView:self.tableView];
    
    self.manager[@"SeperateItem"] = @"SeperateCell";
    self.manager[@"ConfirmMessageItem"] = @"PayMessageCell";
    self.manager[@"PayMoneyItem"] = @"PayMoneyCell";
    self.manager[@"BaseItem"] = @"PayWayCell";
    self.manager[@"TicketItem"] = @"PayCell";
    self.manager[@"ConfirmDateItem"] = @"PayAdditionCell";
    
    [self setupTableView];
    
    //是否安装微信
    if ([WXApi isWXAppInstalled])
    {
        //监听通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayResult:) name:@"WXPay" object:nil];
    }
}

- (void)setupTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    //基本信息
    ConfirmMessageItem *item1 = [[ConfirmMessageItem alloc] initWithPreOrderModel:self.preOrderModel];
    item1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item1];
    
    SeperateItem *item11 = [[SeperateItem alloc] init];
    item11.cellHeight = smallSpacing;
    [section addItem:item11];
    
    //押金
    PayMoneyItem *item2 = [[PayMoneyItem alloc] initWithLeftText:self.preOrderModel.ymoney rightText:@"取车时预收" type:@"deposit"];
    item2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item2];
    
    //还需支付
    PayMoneyItem *item3 = [[PayMoneyItem alloc] initWithLeftText:self.preOrderModel.money rightText:@"100" type:@"surplus"];
    item3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item3];
    
    section = [RETableViewSection section];
    section.headerHeight = 10;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    //支付方式
    BaseItem *item4 = [[BaseItem alloc] initWithTitle:@"支付方式" firstImage:@""];
    item4.cellHeight = MLCellHeight;
    [section addItem:item4];
    
    //微信支付
    TicketItem *item5 = [[TicketItem alloc] init];
    [section addItem:item5];
    
    //立即支付
    MLWeakSelf;
    ConfirmDateItem *item12 = [[ConfirmDateItem alloc] init];
    item12.selectionStyle = UITableViewCellSelectionStyleNone;
    [item12 setDidSelectedBtn:^(NSInteger tag) {
        [weakself confirmToGenerateTheOrder];
    }];
    [section addItem:item12];
}

- (void) confirmToGenerateTheOrder {
    NSString *confirmOrder = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLPay,TOKEN];
    NSDictionary *appa = @{
                           @"oid" : self.preOrderModel.oid,
                           @"money" : self.preOrderModel.money
                           };
    
    [self requestDataPostWithString:confirmOrder params:appa successBlock:^(id responseObject) {
        
        WechatModel *model = [WechatModel mj_objectWithKeyValues:responseObject];
        
        if ([model.status isEqualToString:@"200"]) {
            // 调起微信支付
            PayReq *reqPay = [[PayReq alloc] init];
            reqPay.partnerId = model.partnerid;
            reqPay.prepayId = model.prepayid;
            reqPay.nonceStr = model.noncestr;
            reqPay.timeStamp = [model.timestamp intValue];
            reqPay.package = model.package;
            reqPay.sign = model.sign;
            [WXApi sendReq:reqPay];
        }
    } andFailBlock:^(NSError *error) {

    }];
    
}


- (void)getOrderPayResult:(NSNotification *)notification
{
    if ([notification.object isEqualToString:@"success"])
    {
        [self showHint:@"success"];
        
        PayResultViewController *payResultVC = [[PayResultViewController alloc] init];
        payResultVC.oid = self.preOrderModel.oid;
        payResultVC.payFlag = @"1";
        [self.navigationController pushViewController:payResultVC animated:YES];
    }else if([notification.object isEqualToString:@"cancel"]){
//        PayResultViewController *payResultVC = [[PayResultViewController alloc] init];
//        payResultVC.oid = self.preOrderModel.oid;
//        payResultVC.payFlag = @"2";
//        [self.navigationController pushViewController:payResultVC animated:YES];
    }else{
        PayResultViewController *payResultVC = [[PayResultViewController alloc] init];
        payResultVC.oid = self.preOrderModel.oid;
        payResultVC.payFlag = @"2";
        [self.navigationController pushViewController:payResultVC animated:YES];
    }
    
}

/**
 销毁广播
 */
-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
