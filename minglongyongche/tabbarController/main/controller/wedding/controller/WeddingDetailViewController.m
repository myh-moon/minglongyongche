//
//  WeddingDetailViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/11.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "WeddingDetailViewController.h"

#import "BaseBottomView.h" //立即预订

#import "CarListItem.h"
#import "CarFixedItem.h"

@interface WeddingDetailViewController ()<RETableViewManagerDelegate>

@property (nonatomic,strong) UITableView *weddingDetailTableView;
@property (nonatomic,strong) BaseBottomView *bookView;
@property (nonatomic,strong) RETableViewManager *manager;

@end

@implementation WeddingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavBtn];
    [self.rightNavBtn setTitle:@"分享" forState:0];
    
    [self.view addSubview:self.weddingDetailTableView];
    [self.view addSubview:self.bookView];
    
    [self.view setNeedsUpdateConstraints];
    
    self.manager  = [[RETableViewManager alloc] initWithTableView:self.weddingDetailTableView];
    
    self.manager[@"CarListItem"] = @"WeddingDetailTextCell";
    self.manager[@"CarFixedItem"] = @"WeddingDetailProcessCell";
    
    [self configWeddingDetail];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        [self.weddingDetailTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.weddingDetailTableView autoPinToTopLayoutGuideOfViewController:self withInset:0];
        
        [self.bookView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.bookView autoSetDimension:ALDimensionHeight toSize:50];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

#pragma  mark - getter
- (UITableView *)weddingDetailTableView {
    if (!_weddingDetailTableView) {
        _weddingDetailTableView = [UITableView newAutoLayoutView];
    }
    return _weddingDetailTableView;
}

- (BaseBottomView *)bookView {
    if (!_bookView) {
        _bookView = [BaseBottomView newAutoLayoutView];
        [_bookView.leftBtn setTitle:@"收藏" forState:0];
        [_bookView.rightBtn setTitle:@"立即预订" forState:0];
        
        MLWeakSelf;
        [_bookView setDidSelectedBtn:^(NSInteger tag) {
            if (tag == 56) {//收藏
                NSLog(@"收藏");
            }else{//立即预订
                NSLog(@"立即预订");
            }
        }];
    }
    return _bookView;
}

#pragma mark - end

- (void)configWeddingDetail {
    RETableViewSection *section = [[RETableViewSection alloc] initWithHeaderTitle:@"婚车配图"];
    section.headerHeight = 100;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    CarListItem *item = [[CarListItem alloc] init];
    [section addItem:item];
    
    CarFixedItem *item1 = [[CarFixedItem alloc] init];
    [section addItem:item1];
    
    RETableViewItem *item2 = [[RETableViewItem alloc] initWithTitle:@"基本资料" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
    }];
    [section addItem:item2];
    
    for (NSInteger i=0; i<6; i++) {
        RETableViewItem *item3 = [[RETableViewItem alloc] initWithTitle:@"品牌车型"];
        [section addItem:item3];
    }
    
    RETableViewItem *item4 = [[RETableViewItem alloc] initWithTitle:@"车辆描述" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
    }];
    [section addItem:item4];
    
    RETableViewItem *item5 = [[RETableViewItem alloc] initWithTitle:@"车辆描述具体情况"];
    [section addItem:item5];
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
