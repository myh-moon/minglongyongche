//
//  AuthenPhotoItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/26.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "AuthenPhotoItem.h"

@implementation AuthenPhotoItem

- (instancetype)initWithType:(NSString *)photo {
    self = [super init];
    
    if (self) {
        self.photoType = photo;
    }
    return self;
    
}

@end
