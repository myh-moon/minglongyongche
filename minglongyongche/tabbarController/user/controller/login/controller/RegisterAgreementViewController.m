//
//  RegisterAgreementViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/22.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "RegisterAgreementViewController.h"
#import "BaseModel.h"

@interface RegisterAgreementViewController ()

@property (nonatomic,strong) UIWebView *registerWebView;

@end

@implementation RegisterAgreementViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"注册协议";
    
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    [self.view addSubview:self.registerWebView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)back {
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {

        [self.registerWebView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];

        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UIWebView *)registerWebView {
    if (!_registerWebView) {
        _registerWebView = [UIWebView newAutoLayoutView];
        NSString *agreementStr = [NSString stringWithFormat:@"%@%@",MLBaseUrl,MLRegisterAgreenment];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:agreementStr]];
        [_registerWebView loadRequest:request];
    }
    return _registerWebView;
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
