//
//  UIViewController+HUD.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (HUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

- (void)showSuitHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;


@end
