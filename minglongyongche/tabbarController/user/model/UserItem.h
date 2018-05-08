//
//  UserItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "UserInformationModel.h"

@interface UserItem : RETableViewItem

@property (nonatomic,copy,readwrite) NSString *userName;//用户名
@property (nonatomic,copy,readwrite) NSString *userImage; //用户头像
@property (nonatomic,copy,readwrite) NSString *nickName;  //昵称
@property (nonatomic,copy) NSString *isAuthen;  //是否认证成功

@property (nonatomic,strong) void (^didSelectedBtn) (NSInteger tag);

- (instancetype) initWithUser:(UserInformationModel * )model;


@end
