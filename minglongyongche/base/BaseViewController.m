//
//  BaseViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Color.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,assign) BOOL didSetupConstraits;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置导航条的字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:MLBlackColor,NSFontAttributeName:MLFont7}];
    
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:MLRedColor,NSFontAttributeName:MLFont}];
    
    //去除系统效果
//    self.navigationController.navigationBar.translucent = NO;
    
    //设置导航栏颜色
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:MLGrayColor] forBarMetrics:UIBarMetricsDefault];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //右滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

//返回键
- (UIBarButtonItem *)leftBarItem {
    if (!_leftBarItem) {
        UIButton *leftBtn = [UIButton buttonWithType:0];
        leftBtn.frame = CGRectMake(0, 0, 40, 44);
        [leftBtn setImage:[UIImage imageNamed:@"back_1"] forState:0];
        
        [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        _leftBarItem  = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
    }
    return _leftBarItem;
}

- (UIButton *)leftNavBtn {
    if (!_leftNavBtn) {
        _leftNavBtn = [UIButton buttonWithType:0];
        _leftNavBtn.frame = CGRectMake(0, 0, 0, 44);
        [_leftNavBtn setTitleColor:MLLightGrayColor forState:0];
        _leftNavBtn.titleLabel.font = MLFont;
    }
    return _leftNavBtn;
}


- (UIButton *)rightNavBtn {
    if (!_rightNavBtn) {
        _rightNavBtn = [UIButton buttonWithType:0];
        _rightNavBtn.frame = CGRectMake(0, 0, 0, 44);
        [_rightNavBtn setTitleColor:MLLightGrayColor forState:0];
        _rightNavBtn.titleLabel.font = MLFont;
        
    }
    return _rightNavBtn;
}

- (UIButton *)remindImageButton {
    if (!_remindImageButton) {
        _remindImageButton = [UIButton newAutoLayoutView];
    }
    return _remindImageButton;
}

#pragma mark - method
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
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
