//
//  MyCollectionViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/18.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyCollectionViewController.h"

#import "CarListItem.h"
#import "SeperateItem.h"

#import "CollectionResponse.h"
#import "CarModel.h"

@interface MyCollectionViewController ()

@property (nonatomic,strong) NSMutableArray *collectionList;

@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;

    MLWeakSelf;
    self.pullToRefreshHandler = ^{
        weakself.pageIndex = 1;
        [weakself getCollectionListWithPage:@"1"];
        [weakself.refreshTableView.mj_header endRefreshing];
    };
    
    self.pullToLoadMoreHandler = ^{
        weakself.pageIndex++;
        [weakself getCollectionListWithPage:[NSString stringWithFormat:@"%ld",(long)weakself.pageIndex]];
        [weakself.refreshTableView.mj_footer endRefreshing];
    };
    
    self.manager[@"CarListItem"] = @"CollectionCell";
    self.manager[@"SeperateItem"] = @"SeperateCell";
 
//    [self getCollectionListWithPage:@"1"];
}

- (NSMutableArray *)collectionList {
    if (!_collectionList) {
        _collectionList = [NSMutableArray new];
    }
    return _collectionList;
}

#pragma mark - set up
- (void) setupMyCollectionTableView {
    
    [self.manager removeAllSections];
    
    for (NSInteger i=0; i<self.collectionList.count; i++) {
        RETableViewSection *section = [RETableViewSection section];
        section.headerHeight = 0;
        section.footerHeight = 0;
        [self.manager addSection:section];
        
        SeperateItem *item1 = [[SeperateItem alloc] init];
        item1.cellHeight = smallSpacing;
        item1.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:item1];
        
        CarModel *model = self.collectionList[i];
        
        CarListItem *item0 = [[CarListItem alloc] initWIthModel:model];
        item0.selectionStyle = UITableViewCellSelectionStyleNone;
        item0.editingStyle = UITableViewCellEditingStyleDelete;
        MLWeakSelf;
        @weakify(item0);
        item0.deletionHandler = ^(id item) {
            @strongify(item0);
            [weakself cancelCollectionWithCoid:model.coid withItem:item0];
        };
        [section addItem:item0];
        
    }
}

#pragma mark - method
- (void) getCollectionListWithPage:(NSString *)page {
    NSString *collectionListStr = [NSString stringWithFormat:@"%@%@%@/%@",MLBaseUrl,MLCollectionOfList,TOKEN,page];
    
    MLWeakSelf;
    [self requestDataGetWithString:collectionListStr params:nil successBlock:^(id responseObject) {
        
        if ([page isEqualToString:@"1"]) {
            [weakself.collectionList removeAllObjects];
        }
        
        CollectionResponse *response = [CollectionResponse mj_objectWithKeyValues:responseObject];
        
        for (CarModel *model in response.collect) {
            [weakself.collectionList addObject:model];
        }
        
        if (weakself.collectionList.count <= 0) {
            [weakself showHint:@"您还未收藏任何车辆"];
        }
        
        [weakself setupMyCollectionTableView];
        
        [weakself.refreshTableView reloadData];
        
    } andFailBlock:^(NSError *error) {
        
    }];
}

// 取消收藏
- (void) cancelCollectionWithCoid:(NSString *)coid withItem:(CarListItem *)item {
    NSString *cancelStr = [NSString stringWithFormat:@"%@%@%@/%@",MLBaseUrl,MLCollectionOfCancel,TOKEN,coid];
//    NSDictionary *oooo =@{@"aid" : coid};

    MLWeakSelf;
    [self requestDataPostWithString:cancelStr params:nil successBlock:^(id responseObject) {
        BaseModel *model = [BaseModel mj_objectWithKeyValues:responseObject];
        [weakself showHint:model.info];

        if ([model.status integerValue] == 200) {//取消成功
            [item.section removeItem:item];
            [item.section reloadSectionWithAnimation:UITableViewRowAnimationLeft];
        }
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
