//
//  MyAddressViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyAddressViewController.h"

@interface MyAddressViewController ()

@end

@implementation MyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的取车地址";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    
    self.pullToRefreshHandler = ^{
        
    };
    
    self.pullToLoadMoreHandler = ^{
        
    };
}

- (void) getAddressListWithPage:(NSString *)page {
    NSString *addressStr = [NSString stringWithFormat:@"%@%@",MLBaseUrl,MLBaseUrl];
    
    MLWeakSelf;
    [self requestDataGetWithString:addressStr params:nil successBlock:^(id responseObject) {
        
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
