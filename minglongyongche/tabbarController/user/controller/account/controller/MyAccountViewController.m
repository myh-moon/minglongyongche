//
//  MyAccountViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyAccountViewController.h"
#import "AccountItem.h"
#import "AccountMoneyItem.h"
#import "AccountRuleItem.h"
#import "AccountPayItem.h"

@interface MyAccountViewController ()

@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值余额";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavBtn];
    [self.rightNavBtn setTitle:@"明细" forState:0];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self
                    .tableView];
    self.manager[@"AccountItem"] = @"AccountCell";
    self.manager[@"AccountMoneyItem"] = @"AccountMoneyCell";
    self.manager[@"AccountRuleItem"] = @"AccountRuleCell";
    self.manager[@"AccountPayItem"] = @"AccountPayCell";
    
    
    [self setupTableView];
    
}

- (void)setupTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    AccountItem *item0 = [[AccountItem alloc] init];
    [section addItem:item0];
    
   RETableViewItem  *item1 = [[RETableViewItem alloc] initWithTitle:@"充值活动优惠呦"];
    [section addItem:item1];
    
    AccountMoneyItem *item2 = [[AccountMoneyItem alloc] init];
    [section addItem:item2];
    
    AccountRuleItem *item3 = [[AccountRuleItem alloc] init];
    [section addItem:item3];
    
    RETableViewItem *item4 = [[RETableViewItem alloc] initWithTitle:@"余额1000元使用限制"];
    [section addItem:item4];
    
    AccountPayItem *item5 = [[AccountPayItem alloc] initWithAction:@"立即充值"];
    [section addItem:item5];
    
    NSArray *ijij = @[@"充值协议",@"使用规则",@"联系客服"];
    for (NSInteger i=0; i<3; i++) {
        RETableViewItem *item = [[RETableViewItem alloc] initWithTitle:ijij[i] accessoryType:UITableViewCellAccessoryCheckmark selectionHandler:^(RETableViewItem *item) {
        }];
        [section addItem:item];
    }
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
