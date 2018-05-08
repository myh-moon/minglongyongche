//
//  MLTableViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"

@interface MLTableViewController : NetworkViewController<RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *manager;
@property (nonatomic,strong) UITableView *tableView;

- (void) setupTableView;

@end
