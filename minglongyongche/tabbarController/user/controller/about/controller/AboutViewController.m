//
//  AboutViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,strong) UIWebView *aboutWebView;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关于鸣垄";
    self.navigationItem.leftBarButtonItem = self.leftBarItem;
    
    [self.view addSubview:self.aboutWebView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    if (!self.didSetupConstraints) {
        
        [self.aboutWebView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        self.didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (UIWebView *)aboutWebView {
    if (!_aboutWebView) {
        _aboutWebView = [UIWebView newAutoLayoutView];
        _aboutWebView.backgroundColor = MLBackGroundColor;
        
        NSString *aboutString  = [NSString stringWithFormat:@"%@%@",MLBaseUrl,MLAbout];
        NSURL *aboutUrl = [NSURL URLWithString:aboutString];
        [_aboutWebView loadRequest:[NSURLRequest requestWithURL:aboutUrl]];
    }
    return _aboutWebView;
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
