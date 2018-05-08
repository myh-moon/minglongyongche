//
//  NewsViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"

#import "NewsTypeItem.h"

#import "BaseModel.h"

@interface NewsViewController ()

@property (nonatomic,copy) NSString *numberStr;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    //    self.manager[@"NewsTypeItem"] = @"NewsCell";
    
//    [self setupTableView];
    
    
//    [self getNewsListWithPage:@"1"];
    
    MLWeakSelf;
    self.pullToRefreshHandler = ^{
        [weakself getNewsListWithPage:@"0"];
        
        [weakself.refreshTableView.mj_header endRefreshing];
    };
    
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex++;
        [weakself getNewsListWithPage:[NSString stringWithFormat:@"%d",weakself.pageIndex]];
        [weakself.refreshTableView.mj_footer endRefreshing];
    };
}

- (void)setupNewsTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    NSString *sss = [NSString stringWithFormat:@"未读消息%@",self.numberStr];
    RETableViewItem *item0 = [[RETableViewItem alloc] initWithTitle:sss];
    [section addItem:item0];
    
    MLWeakSelf;
    for (NSInteger i=0; i<10; i++) {
        NSString *opop = [NSString stringWithFormat:@"消息%ld",(long)i];
        RETableViewItem *item1 = [[RETableViewItem alloc] initWithTitle:opop accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
            NewsDetailViewController *newsDetailVC = [[NewsDetailViewController alloc] init];
            [weakself.navigationController pushViewController:newsDetailVC animated:YES];
        }];
        [section addItem:item1];
    }
    
//    NSArray *imgArr = @[@"1",@"1",@"1"];
//    NSArray *titleArr = @[@"订单消息",@"平台通知",@"系统消息"];
//    NSArray *subtitleArr = @[@"",@"合理安排出行",@"您增加了3张优惠券"];
//    NSArray *textArr = @[@"",@"2015/09/09",@"11:09"];
//
//    for (NSInteger i=0; i<3; i++) {
//        NewsTypeItem *item = [[NewsTypeItem alloc]initWithTitleImage:imgArr[i] title:titleArr[i] subtitle:subtitleArr[i] text:textArr[i]];
//        [section addItem:item];
//    }
    
    for (NSInteger i=0; i<10; i++) {
        
    }
    
//    RETableViewItem *item0 = [[RETableViewItem alloc] initWithTitle:@"订单消息" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
//
//    }];
//    [section addItem:item0];
//
//    RETableViewItem *item1 = [[RETableViewItem alloc] initWithTitle:@"平台通知" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
//
//    }];
//    [section addItem:item1];
//
//    RETableViewItem *item2 = [[RETableViewItem alloc] initWithTitle:@"系统消息" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
//    }];
//    [section addItem:item2];
    
}

- (void) getNewsListWithPage:(NSString *)page {
    NSString *newsStr = [NSString stringWithFormat:@"%@%@%@",MLBaseUrl,MLNewsOfList,TOKEN];
    
    MLWeakSelf;
    [self requestDataGetWithString:newsStr params:nil successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
        
        weakself.numberStr = weakself.numberStr?weakself.numberStr:@"0";
        
        [weakself setupNewsTableView];
        
        [weakself.refreshTableView reloadData];
        
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
