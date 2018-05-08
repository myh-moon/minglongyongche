//
//  WeddingViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "WeddingViewController.h"
//#import "WeddingDetailViewController.h"
#import "CarDetailsViewController.h"

#import "CarConditionView.h"

#import "CarListItem.h"

@interface WeddingViewController () <RETableViewManagerDelegate>

@property (nonatomic,strong) CarConditionView *weddingConditionView;
@property (nonatomic,strong) UITableView *weddingTableView;
@property (nonatomic,strong) RETableViewManager *manager;


@end

@implementation WeddingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自选婚车";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavBtn];
    [self.rightNavBtn setTitle:@"搜索" forState:0];
    
    [self.view addSubview:self.weddingConditionView];
    [self.view addSubview:self.weddingTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.weddingTableView];
    _manager[@"CarListItem"] = @"WeddingListCell";
    
    [self configWedding];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.weddingConditionView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.weddingConditionView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.weddingConditionView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        [self.weddingConditionView autoSetDimension:ALDimensionHeight toSize:50];
        
        [self.weddingTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.weddingTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.weddingConditionView];
        
        self.didSetupConstraints  = YES;
    }
    [super updateViewConstraints];
}

#pragma mark - getter
- (CarConditionView *)weddingConditionView {
    if (!_weddingConditionView) {
        _weddingConditionView = [CarConditionView newAutoLayoutView];
    }
    return _weddingConditionView;
}

- (UITableView *)weddingTableView {
    if (!_weddingTableView) {
        _weddingTableView = [UITableView newAutoLayoutView];
//        _weddingTableView.backgroundColor = MLRedColor;
    }
    return _weddingTableView;
}

- (void)configWedding {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    for (NSInteger i=0; i<10; i++) {
        CarListItem *item = [[CarListItem alloc] init];
        item.selectionStyle = UITableViewCellSelectionStyleNone;
        
        MLWeakSelf;
        item.selectionHandler = ^(id item) {
//            WeddingDetailViewController *weddingDetailVC = [[WeddingDetailViewController alloc] init];
//            [weakself.navigationController pushViewController:weddingDetailVC animated:YES];
            
            CarDetailsViewController *carDetailVC = [[CarDetailsViewController alloc] init];
            carDetailVC.type = @"婚车";
            [weakself.navigationController pushViewController:carDetailVC animated:YES];
        };
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
