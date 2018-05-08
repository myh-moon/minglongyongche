//
//  MLTabBarViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MLTabBarViewController.h"
#import "MainViewController.h"
#import "CarListViewController.h"
#import "ActivityViewController.h"
#import "MineViewController.h"

@interface MLTabBarViewController ()

@end

@implementation MLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
}

- (void) setup {
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainVC.title = @"租车";
    mainVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"租车" image:[UIImage imageNamed:@"home_1"] selectedImage:[UIImage imageNamed:@"home_1_selected"]];
    
    CarListViewController *carListVC = [[CarListViewController alloc] init];
    UINavigationController *carListNav = [[UINavigationController alloc] initWithRootViewController:carListVC];
    carListVC.title = @"二手车";
    carListVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"二手车" image:[UIImage imageNamed:@"home_2"] selectedImage:[UIImage imageNamed:@"home_2_selected"]];
    
  
    ActivityViewController *activityVC = [[ActivityViewController alloc] init];
    UINavigationController *activityNav = [[UINavigationController alloc] initWithRootViewController:activityVC];
    activityVC.title = @"发现";
    activityVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"home_3"] selectedImage:[UIImage imageNamed:@"home_3_selected"]];
//    activityNav.tabBarItem  = [[UITabBarItem alloc] initWithTitle:@"活动" image:@"" selectedImage:@""];
    
//    UserViewController *userVC = [[UserViewController alloc] init];
//    UINavigationController *userNav = [[UINavigationController alloc] initWithRootViewController:userVC];
//    userVC.title = @"我的";
    MineViewController *mineVC = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineVC.title = @"我的";
    mineVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"home_4"] selectedImage:[UIImage imageNamed:@"home_4_selected"]];
    
//    userNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:@"" selectedImage:@""];
    
    
    
    
    NSArray *lists = @[mainNav,carListNav,activityNav,mineNav];
    self.viewControllers = lists;
    self.tabBar.tintColor = MLBlackColor;
    
//    self.tabBar.backgroundColor = [UIColor blueColor];
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
