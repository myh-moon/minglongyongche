//
//  CarListViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "CarListViewController.h"
#import "CarDetailsViewController.h"

#import "CarConditionView.h"

#import "CarListItem.h"

@interface CarListViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) CarConditionView *oldCarHeaderView;
@property (nonatomic,strong) UITableView *oldCarTableView;
@property (nonatomic,strong) RETableViewManager *manager;

@end

@implementation CarListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"二手车";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftNavBtn];
    [self.leftNavBtn setTitle:@"定位" forState:0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavBtn];
    [self.rightNavBtn setTitle:@"个人中心" forState:0];
    
    [self.view addSubview:self.oldCarHeaderView];
    [self.view addSubview:self.oldCarTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.oldCarTableView];
    self.manager[@"CarListItem"] = @"OldCarListCell";
    
    [self configOldCarTableView];
}

- (void) configOldCarTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    for ( NSInteger i=0; i<10; i++) {
        CarListItem *item  = [[CarListItem alloc] init];
        
        MLWeakSelf;
        item.selectionHandler = ^(id item) {
            CarDetailsViewController *carDetailsVC = [[CarDetailsViewController alloc] init];
            carDetailsVC.hidesBottomBarWhenPushed = YES;
            carDetailsVC.type = @"二手车";
            [weakself.navigationController pushViewController:carDetailsVC animated:YES];
        };
        [section addItem:item];
        
    }
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.oldCarHeaderView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.oldCarHeaderView autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.oldCarHeaderView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        [self.oldCarHeaderView autoSetDimension:ALDimensionHeight toSize:50];
        
        [self.oldCarTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.oldCarTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.oldCarHeaderView];
    }
    [super updateViewConstraints];
}

#pragma mark - getter
- (CarConditionView *)oldCarHeaderView {
    if (!_oldCarHeaderView) {
        _oldCarHeaderView = [CarConditionView newAutoLayoutView];
    }
    return _oldCarHeaderView;
}

- (UITableView *)oldCarTableView {
    if (!_oldCarTableView) {
        _oldCarTableView = [UITableView newAutoLayoutView];
    }
    return _oldCarTableView;
}

#pragma mark - end

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
