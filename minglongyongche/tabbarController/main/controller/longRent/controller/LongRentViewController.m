//
//  LongRentViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "LongRentViewController.h"

@interface LongRentViewController ()


@end

@implementation LongRentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"请选择车型套餐";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
}

- (void) setupTableView {
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    
    RETableViewItem *item = [RETableViewItem itemWithTitle:@"长租车车"];
    [section addItem:item];
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
