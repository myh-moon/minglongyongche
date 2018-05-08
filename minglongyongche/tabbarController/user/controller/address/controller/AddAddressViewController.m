//
//  AddAddressViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AddAddressViewController.h"

@interface AddAddressViewController ()

@end

@implementation AddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加地址";
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    
    [self setupAddressOfAddTableView];
}

- (void) setupAddressOfAddTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    RETableViewItem *item1 = [[RETableViewItem alloc] initWithTitle:@"用户名"];
    [section addItem:item1];
    
    RETableViewItem *item2 = [[RETableViewItem alloc] initWithTitle:@"用户电话"];
    [section addItem:item2];
    
    RETableViewItem *item3 = [[RETableViewItem alloc] initWithTitle:@"用户地址"];
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
