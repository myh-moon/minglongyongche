//
//  UserItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "UserItem.h"

@implementation UserItem

- (instancetype)initWithUser:(UserInformationModel *)model {
    self = [super init];
    if (self) {
        self.userName = model.name;
        self.userImage = model.img;
    }
    return self;
}

@end
