//
//  NetworkViewController.h
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseViewController.h"

@interface NetworkViewController : BaseViewController

//post
-(void)requestDataPostWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;

//get
-(void)requestDataGetWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;

//- (void) config;

- (void)toLoginifNotLoginFromController:(UIViewController *)controller;;


//- (void)requestImageOfPostWithString:(NSString *)string params:(NSDictionary *)params successBlock:(void(^)(id responseObject))successBlock andFailBlock:(void(^)(NSError *error))failBlock;



@end
