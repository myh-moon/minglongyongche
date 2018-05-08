//
//  MLRefreshTableViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/20.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"

@interface MLRefreshTableViewController : NetworkViewController<RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *manager;
@property (nonatomic,strong) UITableView *refreshTableView;

@property (nonatomic,assign) NSInteger pageIndex;

@property (nonatomic,copy) void (^pullToRefreshHandler)(void);
@property (nonatomic,copy) void (^pullToLoadMoreHandler) (void);

//- (void) headerRefresh ;
//
//- (void) footerRefresh;

@end
