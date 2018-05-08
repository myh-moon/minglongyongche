//
//  MyOrderViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderDetailViewController.h"

#import "MyOrderConditionView.h"

#import "OrderItem.h"
#import "SeperateItem.h"

#import "MyOrderResponse.h"
#import "CarModel.h"

@interface MyOrderViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) MyOrderConditionView *conditionView;
@property (nonatomic,strong) UITableView *myOrderTableView;

@property (nonatomic,strong) RETableViewManager *manager;

@property (nonatomic,strong) NSMutableArray *myOrderList;

@property (nonatomic,strong) NSString *orderType;

@property (nonatomic,assign) NSInteger pageOrder;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    [self.view addSubview:self.conditionView];
    [self.view addSubview:self.myOrderTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.myOrderTableView];
    _manager[@"OrderItem"] = @"MyNewOrderCell";
    _manager[@"SeperateItem"] = @"SeperateCell";

    self.orderType = @"-1";
}

//配置
- (void) configMyOrderList {
    [self.manager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [_manager addSection:section];
    
    MLWeakSelf;
    for (NSInteger i=0; i<self.myOrderList.count; i++) {
        
        SeperateItem *item00 = [[SeperateItem alloc] init];
        item00.cellHeight = middleSpacing;
        item00.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:item00];
        
        CarModel *orderModel = self.myOrderList[i];
        OrderItem *item = [[OrderItem alloc] initWithOrderModel:orderModel];
        item.selectionStyle = UITableViewCellSelectionStyleNone;
        item.selectionHandler = ^(id item) {
            MyOrderDetailViewController *myOrderDetailVC = [[MyOrderDetailViewController alloc] init];
            myOrderDetailVC.oid = orderModel.oid;
            [weakself.navigationController pushViewController:myOrderDetailVC animated:YES];
        };
        [section addItem:item];
    }
}

- (void)updateViewConstraints{
    if (!self.didSetupConstraints) {
        
        [self.conditionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.conditionView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.conditionView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        [self.conditionView autoSetDimension:ALDimensionHeight toSize:50];
        
        [self.myOrderTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.myOrderTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.conditionView];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (MyOrderConditionView *)conditionView {
    if (!_conditionView) {
        _conditionView = [MyOrderConditionView newAutoLayoutView];
        [_conditionView.firstButton setTitle:@"全部" forState:0];
        [_conditionView.secondButton setTitle:@"未付款" forState:0];
        [_conditionView.thirdButton setTitle:@"进行中" forState:0];
        [_conditionView.fourthButton setTitle:@"已完成" forState:0];
        
        MLWeakSelf;
        [_conditionView setDidChooseBtn:^(NSInteger tag) {
            weakself.orderType = [NSString stringWithFormat:@"%ld",tag-446];
            [weakself headerRefreshOfMyOrderList];
        }];
    }
    return _conditionView;
}

- (UITableView *)myOrderTableView {
    if (!_myOrderTableView) {
        _myOrderTableView = [UITableView newAutoLayoutView];
        _myOrderTableView.tableFooterView = [UIView new];
        _myOrderTableView.backgroundColor = MLBackGroundColor;
        
        _myOrderTableView.mj_header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshOfMyOrderList)];
        [_myOrderTableView.mj_header beginRefreshing];
        
        _myOrderTableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshOfMyOrderList)];
        [_myOrderTableView.mj_footer beginRefreshing];
        
    }
    return _myOrderTableView;
}

#pragma mark - method
- (void)headerRefreshOfMyOrderList {
    
    self.pageOrder = 1;
    
    [self getListOfMyOrderWithPage:@"1"];
    
    [self.myOrderTableView.mj_header endRefreshing];
}

- (void)footerRefreshOfMyOrderList {
    self.pageOrder++;
    
    NSString *page = [NSString stringWithFormat:@"%ld",(long)self.pageOrder];
    
    [self getListOfMyOrderWithPage:page];
    
    [self.myOrderTableView.mj_footer endRefreshing];
}

- (void) getListOfMyOrderWithPage:(NSString *)page {
    NSString *orderListStr;
    if ([self.orderType isEqualToString:@"-1"]) {
        orderListStr = [NSString stringWithFormat:@"%@%@%@/%@",MLBaseUrl,MLOrderOfList,TOKEN,page];
    }else{
        orderListStr = [NSString stringWithFormat:@"%@%@%@/%@/%@",MLBaseUrl,MLOrderOfList,TOKEN,page,self.orderType];
    }
    
    MLWeakSelf;
    [self requestDataGetWithString:orderListStr params:nil successBlock:^(id responseObject) {
        
        if ([page integerValue] == 1) {
            [weakself.myOrderList removeAllObjects];
        }
        
        MyOrderResponse *response = [MyOrderResponse mj_objectWithKeyValues:responseObject];
        
        for (CarModel *orderModel in response.order) {
            [weakself.myOrderList addObject:orderModel];
        }
        
        [weakself configMyOrderList];
        
        [weakself.myOrderTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (NSMutableArray *)myOrderList {
    if(!_myOrderList){
        _myOrderList = [NSMutableArray array];
    }
    return _myOrderList;
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
