//
//  AuthenPhotoItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"

@interface AuthenPhotoItem : BaseItem

@property  (nonatomic,copy) NSString *photoType;

- (instancetype) initWithType:(NSString *)photo;

@end
