//
//  MyOrderDetailViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailViewController.h"
#import "CarDetailsViewController.h"  //详情
#import "OrderPayViewController.h" //立即支付

#import "MyOrderDetailResponse.h"
#import "PreOrderModel.h"

#import "SeperateItem.h"
#import "MyOrderDetailTextItem.h"
#import "MyOrderDetailProcessItem.h"
#import "MyOrderDetailAddressItem.h"
#import "MyOrderDetailDurationItem.h"
#import "MyOrderDetailNumberItem.h"
#import "BaseItem.h"
#import "MyOrderDetailActionItem.h"

@interface MyOrderDetailViewController ()

@end

@implementation MyOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单详情";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager[@"MyOrderDetailTextItem"] = @"MyOrderDetailTextCell";
    self.manager[@"MyOrderDetailProcessItem"] = @"MyOrderDetailProcessCell";
    self.manager[@"MyOrderDetailAddressItem"] = @"MyOrderDetailAddressCell";
    self.manager[@"MyOrderDetailDurationItem"] = @"MyOrderDetailDurationCell";
    self.manager[@"SeperateItem"] = @"SeperateCell";
    self.manager[@"MyOrderDetailNumberItem"] = @"MyOrderDetailNumberCell";
    self.manager[@"BaseItem"] = @"MyOrderDetailBaseCell";
    self.manager[@"MyOrderDetailActionItem"] = @"MyOrderDetailActionCell";
    
    [self getMyOrderDetail];
}

- (void) setupMyOrderdetailTableViewWithResponse:(MyOrderDetailResponse *)response {
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.manager addSection:section];
    
    //text
    MyOrderDetailTextItem *item1 = [[MyOrderDetailTextItem alloc] initWithModel:response];
    item1.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item1];
    
    CarModel *orderModel = response.order;
    
    SeperateItem *item11 = [[SeperateItem alloc] init];
    item11.cellHeight = smallSpacing;
    item11.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item11];
    
    //process
    MyOrderDetailProcessItem  *item2 = [[MyOrderDetailProcessItem alloc] initWithProcessStatus:orderModel.statuss];
    item2.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item2];
    
    SeperateItem *item22 = [[SeperateItem alloc] init];
    item22.cellHeight = smallSpacing;
    item22.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item22];
    
    //address
    MyOrderDetailAddressItem *item3 = [[MyOrderDetailAddressItem alloc] initWithOrderAddress:orderModel.qcaddress];
    item3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item3];
    
    //time
    MyOrderDetailDurationItem *item4 = [[MyOrderDetailDurationItem alloc] initWithStartTime:orderModel.qctime endTime:orderModel.hctime];
    item4.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item4];
    
    SeperateItem *item44 = [[SeperateItem alloc] init];
    item44.cellHeight = smallSpacing;
    item44.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item44];
    
    /*************** 订单信息  ***************/
    BaseItem *item5 = [[BaseItem alloc] init];
    item5.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item5];
    
    //1.订单号
    MyOrderDetailNumberItem *item6 = [[MyOrderDetailNumberItem alloc] initWithInfo:@"订单号" detailString:orderModel.oid];
    item6.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item6];
    
    
    //2.下单时间
    MyOrderDetailNumberItem *item7 = [[MyOrderDetailNumberItem alloc] initWithInfo:@"下单时间" detailString:orderModel.addtime];
    item7.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item7];
    
    //支付方式
    MyOrderDetailNumberItem *item8 = [[MyOrderDetailNumberItem alloc] initWithInfo:@"支付方式" detailString:@"微信支付"];
    item8.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item8];
    
    //租车人
    MyOrderDetailNumberItem *item9 = [[MyOrderDetailNumberItem alloc] initWithInfo:@"租车人" detailString:orderModel.uid];
    item9.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item9];
    
    //订单金额
    MyOrderDetailNumberItem *item10 = [[MyOrderDetailNumberItem alloc] initWithInfo:@"订单金额" detailString:orderModel.money];
    item10.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item10];
    
    //用车押金
    MyOrderDetailNumberItem *item12 = [[MyOrderDetailNumberItem alloc] initWithInfo:@"用车押金（到店支付）" detailString:orderModel.ymoney];
    item12.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item12];
    
    //action
    MyOrderDetailActionItem *item13 = [[MyOrderDetailActionItem alloc] initWithMyOrderStatus:orderModel.statuss countDownTime:orderModel.times addTime:orderModel.addtime];
    item13.selectionStyle = UITableViewCellSelectionStyleNone;
    MLWeakSelf;
    item13.didSelectedAction = ^(NSString *acttionType) {
        if ([acttionType isEqualToString:@"删除订单"]) {
            [weakself deleteTheOrderWithOid:orderModel.oid action:@"删除"];
        }else if ([acttionType isEqualToString:@"取消订单"]){
            [weakself deleteTheOrderWithOid:orderModel.oid action:@"取消"];
        }else if ([acttionType isEqualToString:@"重新下单"]){
            UINavigationController *nav = self.navigationController;
            [nav popViewControllerAnimated:NO];
            [nav popViewControllerAnimated:NO];
            CarDetailsViewController *carDetailsVC = [[CarDetailsViewController alloc] init];
            carDetailsVC.hidesBottomBarWhenPushed = YES;
            carDetailsVC.zid = orderModel.aid;
            [nav pushViewController:carDetailsVC animated:NO];
        }else if ([acttionType isEqualToString:@"立即支付"]){
            UINavigationController *navv = self.navigationController;
            [navv popViewControllerAnimated:NO];
            [navv popViewControllerAnimated:NO];
            OrderPayViewController *orderPayVC = [[OrderPayViewController alloc] init];
            
            PreOrderModel *preOrderModel = [[PreOrderModel alloc] init];
            preOrderModel.pic = response.pic;
            preOrderModel.name = response.name;
            preOrderModel.belong = response.belong;
            preOrderModel.is_auto = response.is_auto;
            preOrderModel.site = response.site;
            preOrderModel.money = orderModel.money;
            preOrderModel.ymoney = orderModel.ymoney;
            
            preOrderModel.oid = orderModel.ID;
            
            orderPayVC.preOrderModel = preOrderModel;
            orderPayVC.hidesBottomBarWhenPushed = YES;
            [navv pushViewController:orderPayVC animated:YES];
        }
    };
    [section addItem:item13];
    
}

- (void) getMyOrderDetail {
    NSString *myOrderDetailString = [NSString stringWithFormat:@"%@%@%@/%@",MLBaseUrl,MLMyOrderOfDetail,TOKEN,self.oid];
    
    MLWeakSelf;
    [self requestDataGetWithString:myOrderDetailString params:nil successBlock:^(id responseObject) {
        
        MyOrderDetailResponse *response = [MyOrderDetailResponse mj_objectWithKeyValues:responseObject];
        
        if ([response.status isEqualToString:@"200"]) {
            [weakself setupMyOrderdetailTableViewWithResponse:response];
            
            [weakself.tableView reloadData];
        }
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

//删除订单 取消订单
- (void) deleteTheOrderWithOid:(NSString *)oid action:(NSString *)action{
    
    NSString *actStr;
    if ([action isEqualToString:@"删除"]) {
        actStr = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLMyOrderOfDelete,TOKEN];
    }else if ([actStr isEqualToString:@"取消"]){
        actStr = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLMyOrderOfCancel,TOKEN];
    }
    
//    NSString *deleteStr = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLMyOrderOfDelete,TOKEN];
    
    NSDictionary *params = @{@"oid" : oid};
    
    MLWeakSelf;
    [self requestDataPostWithString:actStr params:params successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
        
        if ([model.status integerValue] == 200) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }
    } andFailBlock:^(NSError *error) {
        
    }];
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
