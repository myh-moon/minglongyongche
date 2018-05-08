//
//  MainViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/30.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MainViewController.h"
#import "NewsViewController.h"  //消息
#import "ShortRentViewController.h"  //短租

#import "CarDetailBannerItem.h" //banner
#import "MainSingleItem.h"
#import "MainListItem.h"

#import "ShortRentResult.h"
#import "CarModel.h"


@interface MainViewController ()

@property (nonatomic,strong) NSMutableArray *hotArray;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.navigationController.navigationBarHidden = YES;
    
    [self getMainBannerList];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
        self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager[@"CarDetailBannerItem"] = @"MainBannerCell";
    self.manager[@"MainSingleItem"] = @"MainSingleCell";
    self.manager[@"MainListItem"] = @"MainListCell";
    
    [self setupMainTableView];
}

- (void)setupMainTableView {
    [self.manager removeAllSections];
    
    RETableViewSection *mainSection = [RETableViewSection section];
    mainSection.headerHeight = 0;
    mainSection.footerHeight = 0;
    [self.manager addSection:mainSection];
    
    //banner
    MLWeakSelf;
    CarDetailBannerItem *item0 = [[CarDetailBannerItem alloc] init];
    [item0 setDidSelectedBtn:^(NSInteger tag) {
        if (tag == 90) {
            NewsViewController *newsVC = [[NewsViewController alloc] init];
            newsVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:newsVC animated:YES];
        }
    }];
    [mainSection addItem:item0];
    
//    notification
//    MainSingleItem *item1 = [[MainSingleItem alloc] init];
//    [mainSection addItem:item1];
    
    //list
    MainListItem *item4 = [[MainListItem alloc] initWithHotList:self.hotArray];
    item4.selectionStyle = UITableViewCellSelectionStyleNone;
    [mainSection addItem:item4];
    [item4 setDidSelectedBtn:^(NSInteger tag) {
//        if (tag == 66) {
        
//        }else if (tag == 678){
            ShortRentViewController *shortRentVC = [[ShortRentViewController alloc] init];
            shortRentVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:shortRentVC animated:YES];
//        }
    }];
}

- (NSMutableArray *)hotArray {
    if (!_hotArray) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

- (void) getMainBannerList {
    NSString *hotListStr = [NSString stringWithFormat:@"%@%@",MLBaseUrl,MLMainHotList];
    
    MLWeakSelf;
    [self requestDataGetWithString:hotListStr params:nil successBlock:^(id responseObject) {
        
        [weakself.hotArray removeAllObjects];
        
        ShortRentResult *response = [ShortRentResult mj_objectWithKeyValues:responseObject];
        
        for (CarModel *model in response.lease) {
            [weakself.hotArray addObject:model];
        }
        
        [weakself setupMainTableView];
        
        [weakself.tableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
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
