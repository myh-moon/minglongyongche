//
//  AppDelegate.m
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AppDelegate.h"
#import "MLTabBarViewController.h"
#import <WXApi.h>


//#import <UMShare/UMShare.h>  //友盟分享


@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    MLTabBarViewController *tabBarVC = [[MLTabBarViewController alloc] init];
    self.window.rootViewController =tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    
////    设置友盟appkey
//    [[UMSocialManager defaultManager] setUmSocialAppkey:@"5ac3472df29d983a910000b5"];
    
    // U-Share 平台设置
//    [self configUSharePlatforms];
//    [self confitUShareSettings];
    
    
    //向微信注册app
    [WXApi registerApp:@"wxfe164628e141a951"];
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    return [WXApi handleOpenURL:url delegate:self];
}

//重写
- (void)onResp:(BaseResp *)resp{
    NSString * strMsg = [NSString stringWithFormat:@"errorCode: %d",resp.errCode];
    NSLog(@"strMsg: %@",strMsg);
    
    NSString * errStr   = [NSString stringWithFormat:@"errStr: %@",resp.errStr];
    NSLog(@"errStr: %@",errStr);
    
    NSString * strTitle;
    
    //判断是微信消息的回调 --> 是支付回调回来的还是消息回调回来的.
    if ([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        strTitle = [NSString stringWithFormat:@"发送媒体消息的结果"];
    }
    
    NSString * wxPayResult;
    
    //判断是否是微信支付回调
    if ([resp isKindOfClass:[PayResp class]])
    {
        //支付返回的结果, 实际支付结果需要去微信服务器端查询
        strTitle = [NSString stringWithFormat:@"支付结果"];
        switch (resp.errCode)
        {
            case WXSuccess:
            {
                strMsg = @"支付结果:";
                NSLog(@"支付成功: %d",resp.errCode);
                wxPayResult = @"success";
                break;
            }
            case WXErrCodeUserCancel:
            {
                strMsg = @"用户取消了支付";
                NSLog(@"用户取消支付: %d",resp.errCode);
                wxPayResult = @"cancel";
                break;
            }
            default:
            {
                strMsg = [NSString stringWithFormat:@"支付失败! code: %d  errorStr: %@",resp.errCode,resp.errStr];
                NSLog(@":支付失败: code: %d str: %@",resp.errCode,resp.errStr);
                wxPayResult = @"faile";
                break;
            }
        }
        
        //全局广播
        NSNotification * notification = [NSNotification notificationWithName:@"WXPay" object:wxPayResult];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}


- (void)confitUShareSettings
{
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}

//- (void)configUSharePlatforms {
//    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:@"http://mobile.umeng.com/social"];
//
//    /* 设置分享到QQ互联的appID
//     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
//     */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105821097"/*设置QQ平台的appID*/  appSecret:nil redirectURL:@"http://mobile.umeng.com/social"];
//}
//
//- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
//    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
////    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:NSMigrationSourceObjectKey annotation:];
//
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:nil annotation:nil];
//    if (!result) {
//        // 其他如支付等SDK的回调
//    }
//    return result;
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
