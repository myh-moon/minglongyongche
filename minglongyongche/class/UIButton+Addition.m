//
//  UIButton+Addition.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "UIButton+Addition.h"

@implementation UIButton (Addition)

- (void)swapImage {
    self.transform = CGAffineTransformRotate(self.transform, M_PI);
    self.titleLabel.transform = CGAffineTransformRotate(self.titleLabel.transform, M_PI);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
}

- (void)upImage {
    self.transform = CGAffineTransformRotate(self.transform, M_PI_2);
    self.titleLabel.transform = CGAffineTransformRotate(self.titleLabel.transform, M_PI_2 * 3);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_2 * 3);
}
@end
