//
//  NewsDetailViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/23.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "BaseModel.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息详情";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
}

- (void) setupNewsDetailTableView {
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    RETableViewItem *item = [[RETableViewItem alloc] initWithTitle:@"消息id"];
    [section addItem:item];
}

- (void) getNewsDetail {
    NSString *newsDetailStr = [NSString stringWithFormat:@"%@%@%@/%@",MLBaseUrl,MLNewsOfList,TOKEN,self.nid];
    
    MLWeakSelf;
    [weakself requestDataGetWithString:newsDetailStr params:nil successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];
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
