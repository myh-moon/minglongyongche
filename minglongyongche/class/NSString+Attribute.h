//
//  NSString+Attribute.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Attribute)

//两部分
+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat )firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat )secondFont secongColor:(UIColor *)secondColor;

//三部分
+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat )firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat )secondFont secongColor:(UIColor *)secondColor thirdPart:(NSString *)thirdStr thirdFont:(CGFloat )thirdFont thirdColor:(UIColor *)thirdColor;

////两部分 带行间距
+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat )firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat )secondFont secongColor:(UIColor *)secondColor space:(CGFloat)lineSpace align:(NSInteger)alignment;

//三部分 带行间距
+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat )firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat )secondFont secongColor:(UIColor *)secondColor thirdPart:(NSString *)thirdStr thirdFont:(CGFloat )thirdFont thirdColor:(UIColor *)thirdColor space:(CGFloat )lineSpace align:(NSInteger)alignment;


@end
