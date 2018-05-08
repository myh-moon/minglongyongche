//
//  PayResultViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "PayResultViewController.h"
#import "MyOrderViewController.h"

#import "ResultItem.h"

#import "PayResultModel.h"

@interface PayResultViewController ()

@end

@implementation PayResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tielArr = @[@"支付成功",@"支付失败"];
    self.title = tielArr[ [self.payFlag integerValue] -1];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftNavBtn];
    self.leftNavBtn.userInteractionEnabled = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavBtn];
    [self.rightNavBtn setTitle:@"完成" forState:0];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager[@"ResultItem"] = @"ResultCell";
        
    [self getResultOfPay];
}

- (void)setupResultTableViewWithModel:(PayResultModel *)model {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight  = 0;
    [self.manager addSection:section];
    
    ResultItem *item = [[ResultItem alloc] initWithPayResultModel:model];
    item.selectionStyle  = UITableViewCellSelectionStyleNone;
    item.resultFlag = self.payFlag;
    MLWeakSelf;
    [item setDidSelectedBtn:^(NSInteger tag) {
        
        UINavigationController *navvv = weakself.navigationController;
        [navvv popViewControllerAnimated:NO];
        [navvv popViewControllerAnimated:NO];
        [navvv popViewControllerAnimated:NO];
        [navvv popViewControllerAnimated:NO];
        [navvv popViewControllerAnimated:NO];
        
        MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
        myOrderVC.hidesBottomBarWhenPushed = YES;
        [navvv pushViewController:myOrderVC animated:NO];
    }];
    [section addItem:item];
}

- (void) getResultOfPay {
    NSString *payResult = [NSString stringWithFormat:@"%@%@%@/%@",MLBaseUrl,MLPayResult,TOKEN,self.oid];
    
    MLWeakSelf;
    [self requestDataGetWithString:payResult params:nil successBlock:^(id responseObject) {
      
        PayResultModel *model = [PayResultModel mj_objectWithKeyValues:responseObject];
        
        [weakself setupResultTableViewWithModel:model];
        
        [weakself.tableView reloadData];

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
