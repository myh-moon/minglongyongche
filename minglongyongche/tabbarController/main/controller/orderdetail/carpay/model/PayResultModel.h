//
//  PayResultModel.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/28.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseModel.h"

@interface PayResultModel : BaseModel

@property (nonatomic,copy) NSString *oid;
@property (nonatomic,copy) NSString *uid;  //认证的姓名
@property (nonatomic,copy) NSString *aid;
@property (nonatomic,copy) NSString *money;
@property (nonatomic,copy) NSString *qcaddress;
@property (nonatomic,copy) NSString *qctime;
@property (nonatomic,copy) NSString *hcaddress;
@property (nonatomic,copy) NSString *hctime;
@property (nonatomic,copy) NSString *type;  

@end
