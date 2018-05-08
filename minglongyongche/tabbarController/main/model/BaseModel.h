//
//  BaseModel.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property (nonatomic,copy) NSString *info;  //返回信息J
@property (nonatomic,copy) NSString *status;  //状态码   //status200正常，404异常
@property (nonatomic,copy) NSString *token;

@end
