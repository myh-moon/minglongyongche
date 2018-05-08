//
//  OrderConfirmViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OrderConfirmViewController.h"
#import "OrderPayViewController.h"

#import "BaseBottomView.h"

#import "CarOrderItem.h"
#import "BaseItem.h"
#import "WordItem.h"
#import "ConfirmDateItem.h"

#import "BaseModel.h"

@interface OrderConfirmViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) UITableView *carDetailTableView;
@property (nonatomic,strong) BaseBottomView *payBottomView;

@property (nonatomic,strong) RETableViewManager *manager;

@property (nonatomic,strong) NSMutableDictionary *orderDic;

@end

@implementation OrderConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"确认订单";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    [self.view addSubview:self.carDetailTableView];
    [self.view addSubview:self.payBottomView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.carDetailTableView];
    
    self.manager[@"BaseItem"] = @"ConfirmPhoneCell";
//    self.manager[@"ConfirmDateItem"] = @"ConfirmTextCell";
    self.manager[@"ConfirmDateItem"] = @"ConfirmDateCell";
    
    [self setupDetailTableView];
    
    [self generatePreOrder];
    
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.carDetailTableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.carDetailTableView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.carDetailTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        [self.carDetailTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.payBottomView];
        
        [self.payBottomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.payBottomView autoSetDimension:ALDimensionHeight toSize:50];
        
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

- (BaseBottomView *)payBottomView {
    if (!_payBottomView) {
        _payBottomView = [BaseBottomView newAutoLayoutView];
        [_payBottomView.leftBtn setTitle:@"实收款：1000元" forState:0];
        [_payBottomView.rightBtn setTitle:@"提交订单" forState:0];
        _payBottomView.multiple = 0.4;
        
        MLWeakSelf;
        [_payBottomView setDidSelectedBtn:^(NSInteger tag) {
            if (tag == 57) {
                NSLog(@"付款");
                OrderPayViewController *orderPayVC = [[OrderPayViewController alloc] init];
                [weakself.navigationController pushViewController:orderPayVC animated:YES];
            }
        }];
    }
    return _payBottomView;
}

- (void)setupDetailTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
//    BaseItem *item0 = [[BaseItem alloc] init];
//    item0.selectionStyle = UITableViewCellSelectionStyleNone;
//    [section addItem:item0];
    
    MLWeakSelf;
    ConfirmDateItem *item1 = [[ConfirmDateItem alloc] init];
    item1.selectionStyle = UITableViewCellSelectionStyleNone;
    [item1 setDidSelectedBtn:^(NSInteger tag) {
        [weakself showPickerViewInView:weakself.view finishBlock:^(NSString *dateStr, NSDate *date) {
            if (tag == 45) {//取车
                
            }else if (tag == 46){//还车
                
            }
            
        }];
    }];
    [section addItem:item1];
    
//    NSArray *tiArr = @[@"取车时间",@"还车时间"];
//    for (NSInteger i=0; i<2; i++) {
//        REDateTimeItem *item1 = [[REDateTimeItem alloc] initWithTitle:tiArr[i] value:nil placeholder:@"请选择" format:@"YYYY-MM-DD hh:mm:ss" datePickerMode:UIDatePickerModeDateAndTime];
//        item1.selectionStyle = UITableViewCellSelectionStyleNone;
////        NSDate *startDate = [NSDate date];
////        item1.pickerStartDate = startDate;
//        item1.selectionStyle = UITableViewCellSelectionStyleNone;
//        [section addItem:item1];
//        
//        MLWeakSelf;
//        item1.onChange = ^(REDateTimeItem *item) {
//            if ([item.title isEqualToString:@"开始时间"]) {
////                weakself.orderDic setValue:item.value forKey:<#(nonnull NSString *)#>
//            }
//            NSLog(@"%@",item.value);
//        };
//    }
    
//    RELongTextItem *item1 = [[RELongTextItem alloc] initWithValue:nil placeholder:@"大师傅你不就是 v 北京"];
//    [section addItem:item1];
    
//    WordItem *item2 = [[WordItem alloc] init];
//    [section addItem:item2];
    
    NSArray *fArr = @[@"车辆租赁费用",@"基本保险服务",@"总计收费",@"取车方式"];
    NSArray *rArr = @[@"199元",@"88元",@"287元",@"到店自取"];
    for (NSInteger j=0; j<4; j++) {
        RERadioItem *item3 = [[RERadioItem alloc] initWithTitle:fArr[j] value:rArr[j] selectionHandler:nil];
        item3.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:item3];
    }
}

//支付
- (void) generatePreOrder {
    NSString *generateStr = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLOrderOfGenerate,TOKEN];
    
  //时间
    NSDate *date = [NSDate date];
    long int timeSp = (long)[date timeIntervalSince1970];
    NSString *nowStr = [NSString stringWithFormat:@"%ld",timeSp];
//
//    //还车时间
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"YYYY-MM-DD hh:mm:ss";
//    NSString *time = [formatter stringFromDate:date];
//    NSDate *dateTodo = [formatter dateFromString:@"2018-4-24 18:00"];
//    NSString *timeSp2 = [NSString stringWithFormat:@"%ld", (long)[dateTodo timeIntervalSince1970]];
//    NSString *secondStr = [NSString stringWithFormat:@"%@",timeSp2];
    
    [self.orderDic setValue:self.carModel.uid forKey:@"uid"];
    [self.orderDic setValue:self.carModel.zid forKey:@"aid"];
    [self.orderDic setValue:self.carModel.address forKey:@"qcaddress"];
    [self.orderDic setValue:self.carModel.address forKey:@"hcaddress"];
    [self.orderDic setValue:@"2018-05-01 12:00" forKey:@"qctime"];
    [self.orderDic setValue:@"2018-05-10 16:00" forKey:@"hctime"];
    [self.orderDic setValue:@"0" forKey:@"status"];
    [self.orderDic setValue:nowStr forKey:@"addtime"];
    [self.orderDic setValue:@"1" forKey:@"type"];
    [self.orderDic setValue:@"2000" forKey:@"money"];


    
    MLWeakSelf;
    [self requestDataPostWithString:generateStr params:self.orderDic successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
        
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
