//
//  OrderTicketViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "OrderTicketViewController.h"
#import "TicketItem.h"
#import "SeperateItem.h"

#import "TicketResponse.h"
#import "TicketModel.h"

@interface OrderTicketViewController ()

@property (nonatomic,strong) NSMutableArray *validArray;

@property (nonatomic,assign) NSInteger orderTicketPage;

@end

@implementation OrderTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"选择优惠券";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    self.manager[@"TicketItem"] = @"TicketCell";
    self.manager[@"SeperateItem"] = @"SeperateCell";
    
    self.pageIndex = 1;
    
    MLWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getOrderTicketWithPage:@"1"];
        [weakself.refreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex++;
        [weakself getOrderTicketWithPage:[NSString stringWithFormat:@"%ld",(long)weakself.pageIndex]];
        [weakself.refreshTableView.mj_footer endRefreshing];
    };
}

- (void) setupOrderTicketTableView {
    
    self.refreshTableView.backgroundColor = MLWhiteColor;
    
    [self.manager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    for (NSInteger i=0; i<self.validArray.count; i++) {
        
        TicketModel *model = self.validArray[i];
        
        MLWeakSelf;
        TicketItem *item = [[TicketItem alloc] initWithOrderTicketModel:model validStartTime:self.starttime validEndTime:self.endtime];
        
        item.selectionHandler = ^(id item) {
            
            if (weakself.didSelectedTicket) {
                weakself.didSelectedTicket(model);
                [weakself.navigationController popViewControllerAnimated:YES];
            }
        };
        [section addItem:item];
    }
}

- (void) getOrderTicketWithPage:(NSString *)page {
    NSString *ticketStr = [NSString stringWithFormat:@"%@%@%@/%@/0",MLBaseUrl,MLMyTicket,TOKEN,page];
    
    MLWeakSelf;
    [self requestDataGetWithString:ticketStr params:nil successBlock:^(id responseObject) {
        if ([page integerValue] == 1) {
            [weakself.validArray removeAllObjects];
        }
        TicketResponse *response = [TicketResponse mj_objectWithKeyValues:responseObject];

        for (TicketModel *model in response.tickets) {
            [weakself.validArray addObject:model];
        }
        
        [weakself setupOrderTicketTableView];
        
        [weakself.refreshTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

- (NSMutableArray *)validArray {
    if (!_validArray) {
        _validArray = [NSMutableArray array];
    }
    return _validArray;
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
