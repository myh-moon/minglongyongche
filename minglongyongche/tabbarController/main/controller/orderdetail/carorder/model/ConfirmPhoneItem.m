//
//  ConfirmPhoneItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ConfirmPhoneItem.h"

@implementation ConfirmPhoneItem

- (instancetype)initWithLeftTitle:(NSString *)leftString leftImage:(NSString *)leftImage leftTextColor:(UIColor *)color leftTextFont:(CGFloat)font rightImage:(NSString *)rightImage hidden:(BOOL)isHidden {
    self = [super init];
    if (self) {
        self.leftTitle = leftString;
        self.leftImage = leftImage;
        self.leftFont = font;
        self.leftColor = color;
        self.rightImage = rightImage;
        self.isHidden = isHidden;
    }
    return self;
}

@end
