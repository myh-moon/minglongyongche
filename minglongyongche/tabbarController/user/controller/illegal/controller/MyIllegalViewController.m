//
//  MyIllegalViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyIllegalViewController.h"
#import "IllegalItem.h"

@interface MyIllegalViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UITableView *myIllegalTableView;

@property (nonatomic,strong) RETableViewManager *manager;


@end

@implementation MyIllegalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"违章专区";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.myIllegalTableView];
    
    [self.view setNeedsUpdateConstraints];
    
    _manager = [[RETableViewManager alloc] initWithTableView:self.myIllegalTableView];
    _manager[@"IllegalItem"] = @"IllegalCell";
    
    [self config];
}

- (void)config {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [_manager addSection:section];
    
    
    for (NSInteger i=0; i<10; i++) {
//        RETableViewItem *item = [[RETableViewItem alloc] initWithTitle:@"违章记录"];
//        item.cellHeight = 80;
//        [section addItem:item];
        
        IllegalItem *item = [[IllegalItem alloc] init];
        [section addItem:item];
        
    }
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.headerView autoPinEdgeToSuperviewEdge: ALEdgeLeft];
        [self.headerView autoPinEdgeToSuperviewEdge: ALEdgeRight];
        [self.headerView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        [self.headerView autoSetDimension:ALDimensionHeight toSize:50];
        
        [self.myIllegalTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.myIllegalTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerView];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [UIView newAutoLayoutView];
        _headerView.backgroundColor = MLRedColor;
    }
    return _headerView;
}

- (UITableView *)myIllegalTableView {
    if (!_myIllegalTableView) {
        _myIllegalTableView = [UITableView newAutoLayoutView];
    }
    return _myIllegalTableView;
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
