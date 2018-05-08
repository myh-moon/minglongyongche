//
//  MLRefreshTableViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/20.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MLRefreshTableViewController.h"

@interface MLRefreshTableViewController ()

@end

@implementation MLRefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.refreshTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.refreshTableView];
    
    self.pageIndex = 1;
}


- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.refreshTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}


- (UITableView *)refreshTableView {
    if (!_refreshTableView) {
        _refreshTableView = [UITableView newAutoLayoutView];
        _refreshTableView.backgroundColor = MLBackGroundColor;
        _refreshTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, bigSpacing)];
        
        
        MLWeakSelf;
        _refreshTableView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
            if (weakself.pullToRefreshHandler) {
                weakself.pullToRefreshHandler();
            }
        }];
        [_refreshTableView.mj_header beginRefreshing];
        
        _refreshTableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
            if (weakself.pullToLoadMoreHandler) {
                weakself.pullToLoadMoreHandler();
            }
        }];
        [_refreshTableView.mj_footer endRefreshing];
    }
    return _refreshTableView;
}


//- (UITableView *)refreshTableView {
//    if (!_refreshTableView) {
//        _refreshTableView = [UITableView newAutoLayoutView];
//
//        MLWeakSelf;
//        _refreshTableView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//            [weakself headerRefresh];
////            if (weakself.pullToRefreshHandler) {
////                weakself.pullToRefreshHandler();
//            }
//        }];
//        [_refreshTableView.mj_header beginRefreshing];
//
//        _refreshTableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
//            [weakself footerRefresh];
////            if (weakself.pullToLoadMoreHandler) {
////                weakself.pullToLoadMoreHandler();
////            }
//        }];
//        [_refreshTableView.mj_footer beginRefreshing];
//    }
//    return _refreshTableView;
//}

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
