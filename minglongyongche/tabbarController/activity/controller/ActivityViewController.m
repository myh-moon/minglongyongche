//
//  ActivityViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityDetailViewController.h"

#import "CarListItem.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"活动";
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager[@"CarListItem"] = @"ActivityCell";
    
    [self configActivityTableView];
}

- (void) configActivityTableView {
    for (NSInteger i=0; i<10; i++) {
        RETableViewSection *section = [RETableViewSection section];
        section.headerHeight = 0;
        section.footerHeight = middleSpacing;
        [self.manager addSection:section];
        CarListItem *item = [[CarListItem alloc] init];
        item.selectionStyle = UITableViewCellSelectionStyleNone;
        [item deselectRowAnimated:YES];
        MLWeakSelf;
        item.selectionHandler = ^(id item) {
            ActivityDetailViewController *activityDetailVC = [[ActivityDetailViewController alloc] init];
            [weakself.navigationController pushViewController:activityDetailVC animated:YES];
        };
        [section addItem:item];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
