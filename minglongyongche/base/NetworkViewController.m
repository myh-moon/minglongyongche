//
//  NetworkViewController.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NetworkViewController.h"
#import "BaseModel.h"
#import "LoginViewController.h"


@interface NetworkViewController ()

@end

@implementation NetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)requestDataGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void (^)(id))successBlock andFailBlock:(void (^)(NSError *))failBlock {
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [session GET:string parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (successBlock) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)requestDataPostWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void (^)(id responseObject))successBlock andFailBlock:(void (^)(NSError *error))failBlock
{
//    [self showHudInView:self.view hint:@"正在加载"];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    //设置超时时间
    [session.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    session.requestSerializer.timeoutInterval = 5.f;
    [session.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
//    MLWeakSelf;
    [session POST:string parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
        }
    }];
}

- (void)toLoginifNotLoginFromController:(UIViewController *)controller {
//    controller
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:loginVC animated:YES completion:nil];
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
