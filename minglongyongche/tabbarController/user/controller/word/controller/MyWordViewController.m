//
//  MyWordViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyWordViewController.h"
#import "WordItem.h"
#import "AccountPayItem.h"

@interface MyWordViewController ()

@end

@implementation MyWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"兑换口令";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    
    self.manager[@"WordItem"]  = @"WordCell";
    self.manager[@"AccountPayItem"] = @"AccountPayCell";
    
    [self setupTableView];
    
}

- (void)setupTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    WordItem *item0 = [[WordItem alloc] init];
    [section addItem:item0];
    
    RETableViewItem *item1 = [[RETableViewItem alloc] initWithTitle:@"兑换规则"];
    [section addItem:item1];
    
    AccountPayItem *item2 = [[AccountPayItem alloc] initWithAction:@"我要兑换"];
    [section addItem:item2];
    
    RETableViewItem *item3 = [[RETableViewItem alloc] initWithTitle:@"banner"];
    item3.cellHeight = 100;
    item3.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addItem:item3];
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
