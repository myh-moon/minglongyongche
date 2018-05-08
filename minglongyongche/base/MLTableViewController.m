//
//  MLTableViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MLTableViewController.h"

@interface MLTableViewController ()

@end

@implementation MLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
//    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
//        [self.tableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView newAutoLayoutView];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = MLBackGroundColor;
    }
    return _tableView;
}

- (void)setupTableView {
    
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
