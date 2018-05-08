//
//  UIButton+Block.h
//  minglongyongche
//
//  Created by jiamanu on 2018/3/29.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton *btn);

@interface UIButton (Block)

- (void) addAction:(ButtonBlock )block;

@end
