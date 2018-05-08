//
//  MineViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MineViewController.h"
#import "MyTicketViewController.h"  //优惠券
#import "MyAccountViewController.h"  //充值余额
#import "MyWordViewController.h"  //口令
#import "MyOrderViewController.h"  //我的订单
#import "MyIllegalViewController.h"  //违章记录
#import "LoginViewController.h"  //登录
#import "AuthenViewController.h" //认证
#import "MyCollectionViewController.h"  //收藏
#import "AboutViewController.h"  //关于鸣垄



#import "UserItem.h"
#import "UserAccountItem.h"
//#import "UserOrderItem.h"
#import "BaseItem.h"
//#import "UserTicketItem.h"
#import "SeperateItem.h"

#import "UserInformationModel.h"

@interface MineViewController ()

@property (nonatomic,assign) BOOL isLoginr;  //判定是否登录

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
    NSString *auth = [[NSUserDefaults standardUserDefaults] objectForKey:@"authen"];
    [self setupMineTableView];
    [self.tableView reloadData];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightNavBtn];
    [self.rightNavBtn setTitle:@"设置" forState:0];
    
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager[@"UserItem"] = @"UserCell";
    self.manager[@"UserAccountItem"] = @"UserThreeCell";
    self.manager[@"BaseItem"] = @"BaseDoubleCell";  //我的订单
    self.manager[@"SeperateItem"] = @"SeperateCell"; //
    
    [self setupMineTableView];
}

- (void)setupMineTableView {
    
    [self.manager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    MLWeakSelf;
    //用户信息
    UserItem *item0 = [[UserItem alloc] init];
    
    if (TOKEN) {
        item0.userName = @"已登录  ";
    }else{
        item0.userName = @"未登录，请登录  ";
    }
    
    NSString *authen = [[NSUserDefaults standardUserDefaults] objectForKey:@"authen"];
    if ([authen isEqualToString:@"403"]) {
        item0.isAuthen = @"您还未通过实名认证，去认证！";
    }else {
        item0.isAuthen = @"";
    }
    item0.selectionStyle = UITableViewCellSelectionStyleNone;
    @weakify(item0);
    [item0 setDidSelectedBtn:^(NSInteger tag) {
        if (tag == 88) {//修改用户名|| 登录
            @strongify(item0);
            if ([item0.userName isEqualToString:@"已登录"]) {//进入个人中心
                
            }else{
                LoginViewController *loginVC = [[LoginViewController alloc] init];
                loginVC.hidesBottomBarWhenPushed = YES;
                [weakself presentViewController:loginVC animated:YES completion:nil];
            }
            
        }else {//认证
            [weakself showHint:@"去认证"];
            AuthenViewController *authenVC = [[AuthenViewController alloc] init];
            authenVC.hidesBottomBarWhenPushed = YES;
            [weakself.navigationController pushViewController:authenVC animated:YES];
        }
    }];
    [section addItem:item0];
    
//    //用户资金
//    UserAccountItem *item1 = [[UserAccountItem alloc] init];
//    [item1 setDidClickBtn:^(NSInteger tag) {
//        if (tag == 45) {//收藏
//            [weakself showHint:@"收藏"];
//
//            MyCollectionViewController *myCollectionVC = [[MyCollectionViewController alloc] init];
//            myCollectionVC.hidesBottomBarWhenPushed = YES;
//            [weakself.navigationController pushViewController:myCollectionVC animated:YES];
//        }else if (tag == 46){//未处理违章
//            [weakself showHint:@"未处理违章"];
////            MyAccountViewController *myAccountVC = [[MyAccountViewController alloc] init];
////            myAccountVC.hidesBottomBarWhenPushed = YES;
////            [weakself.navigationController pushViewController:myAccountVC animated:YES];
//
//            MyIllegalViewController *myIllegalVC = [[MyIllegalViewController alloc] init];
//            myIllegalVC.hidesBottomBarWhenPushed = YES;
//            [weakself.navigationController pushViewController:myIllegalVC animated:YES];
//
//        }else{//我的钱包
//            [weakself showHint:@"我的钱包"];
////            MyWordViewController *myWordVC = [[MyWordViewController alloc] init];
////            myWordVC.hidesBottomBarWhenPushed = YES;
////            [weakself.navigationController pushViewController:myWordVC animated:YES];
//
//            MyAccountViewController *myAccountVC = [[MyAccountViewController alloc] init];
//            myAccountVC.hidesBottomBarWhenPushed = YES;
//            [weakself.navigationController pushViewController:myAccountVC animated:YES];
//
//        }
//    }];
//    [section addItem:item1];
    
//    SeperateItem *item00 = [[SeperateItem alloc] init];
//    item0.cellHeight = smallSpacing;
//    [section addItem:item00];
    
    BaseItem *item1 = [[BaseItem alloc] initWithTitle:@"    我的收藏" firstImage:@"mine_collection" secondText:@""];
    item1.selectionStyle = UITableViewCellSelectionStyleNone;
    
    item1.selectionHandler = ^(id item) {
        MyCollectionViewController *myCollectionVC = [[MyCollectionViewController alloc] init];
        myCollectionVC.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:myCollectionVC animated:YES];
    };
    [section addItem:item1];
    
    
    //我的订单
    section = [RETableViewSection section];
    section.headerHeight = smallSpacing;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    BaseItem *item2 = [[BaseItem alloc] initWithTitle:@"    我的订单" firstImage:@"mine_order" secondText:@""];
    item2.selectionStyle = UITableViewCellSelectionStyleNone;
    
    item2.selectionHandler = ^(id item) {
        MyOrderViewController *myOrderVC = [[MyOrderViewController alloc] init];
        myOrderVC.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:myOrderVC animated:YES];
    };
    [section addItem:item2];
    
    section = [RETableViewSection section];
    section.headerHeight = smallSpacing;
    section.footerHeight = 0;
    [self.manager addSection:section];
//    NSArray *asArr = @[@"    邀请有礼",@"    关于鸣垄",@"    联系客服"];
//    NSArray *imArr = @[@"mine_gift",@"mine_about",@"mine_service"];
    NSArray *asArr = @[@"    关于鸣垄",@"    联系客服"];
    NSArray *imArr = @[@"mine_about",@"mine_service"];
    for (NSInteger i=0; i<2; i++) {
        BaseItem *item3 = [[BaseItem alloc] initWithTitle:asArr[i] firstImage:imArr[i] secondText:@""];
        item3.selectionStyle = UITableViewCellSelectionStyleNone;
        [section addItem:item3];
        
            item3.selectionHandler = ^(id item) {
                if (i == 0) {//关于鸣垄
                    AboutViewController *aboutVC = [[AboutViewController alloc] init];
                    aboutVC.hidesBottomBarWhenPushed = YES;
                    [weakself.navigationController pushViewController:aboutVC animated:YES];
                }else  if (i == 1) {//联系客服
                    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"021-62127903"];
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
                }
            };
    }
    
    section = [RETableViewSection section];
    section.headerHeight = smallSpacing;
    section.footerHeight = 0;
    [self.manager addSection:section];
    
    BaseItem *item4 = [[BaseItem alloc] initWithTitle:@"    我的优惠券" firstImage:@"mine_discounts" secondText:@""];
    item4.selectionStyle = UITableViewCellSelectionStyleNone;
    item4.selectionHandler = ^(id item) {
        MyTicketViewController *myTicketVC = [[MyTicketViewController alloc] init];
        myTicketVC.hidesBottomBarWhenPushed = YES;
        [weakself.navigationController pushViewController:myTicketVC animated:YES];
    };
    [section addItem:item4];
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
