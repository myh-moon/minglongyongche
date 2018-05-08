//
//  NSString+Attribute.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NSString+Attribute.h"

@implementation NSString (Attribute)

+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat )firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat )secondFont secongColor:(UIColor *)secondColor {
    
    NSString *string = [NSString stringWithFormat:@"%@%@",firstStr,secondStr];
    NSMutableAttributedString *muString = [[NSMutableAttributedString alloc] initWithString:string];
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:firstFont],NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstStr.length)];
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:secondFont],NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstStr.length, secondStr.length)];
    
    
    
    
    
    
//    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
//    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
//    paraStyle.alignment = NSTextAlignmentLeft;
//    paraStyle.lineSpacing = UILABEL_LINE_SPACE; //设置行间距
//    paraStyle.hyphenationFactor = 1.0;
//    paraStyle.firstLineHeadIndent = 0.0;
//    paraStyle.paragraphSpacingBefore = 0.0;
//    paraStyle.headIndent = 0;
//    paraStyle.tailIndent = 0;
//    //设置字间距 NSKernAttributeName:@1.5f
    //    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f}
    
    
    
    return muString;
}

+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat)firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat)secondFont secongColor:(UIColor *)secondColor thirdPart:(NSString *)thirdStr thirdFont:(CGFloat)thirdFont thirdColor:(UIColor *)thirdColor {
    
    NSString *string = [NSString stringWithFormat:@"%@%@%@",firstStr,secondStr,thirdStr];
    
    NSMutableAttributedString *muString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:firstFont],NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstStr.length)];
    
    
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:secondFont],NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstStr.length, secondStr.length)];
    
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:thirdFont],NSForegroundColorAttributeName:thirdColor} range:NSMakeRange(secondStr.length+firstStr.length, thirdStr.length)];
    
    return muString;
}

+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat)firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat)secondFont secongColor:(UIColor *)secondColor space:(CGFloat)lineSpace align:(NSInteger)alignment{
    
    NSString *string = [NSString stringWithFormat:@"%@%@",firstStr,secondStr];
    NSMutableAttributedString *muString = [[NSMutableAttributedString alloc] initWithString:string];
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:firstFont],NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstStr.length)];
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:secondFont],NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstStr.length, secondStr.length)];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.paragraphSpacing = lineSpace;
    paraStyle.alignment = alignment;
//    paraStyle.alignment = NSTextAlignmentCenter;
    [muString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, string.length)];
    
    return muString;
}

+ (NSMutableAttributedString *)setFirstPart:(NSString *)firstStr firstFont:(CGFloat)firstFont firstColor:(UIColor *)firstColor secondPart:(NSString *)secondStr secondFont:(CGFloat)secondFont secongColor:(UIColor *)secondColor thirdPart:(NSString *)thirdStr thirdFont:(CGFloat)thirdFont thirdColor:(UIColor *)thirdColor space:(CGFloat)lineSpace align:(NSInteger)alignment{
    NSString *string = [NSString stringWithFormat:@"%@%@%@",firstStr,secondStr,thirdStr];
    
    NSMutableAttributedString *muString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:firstFont],NSForegroundColorAttributeName:firstColor} range:NSMakeRange(0, firstStr.length)];
    
    
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:secondFont],NSForegroundColorAttributeName:secondColor} range:NSMakeRange(firstStr.length, secondStr.length)];
    
    [muString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:thirdFont],NSForegroundColorAttributeName:thirdColor} range:NSMakeRange(secondStr.length+firstStr.length, thirdStr.length)];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.paragraphSpacing = lineSpace;
    paraStyle.alignment = alignment;
    [muString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, string.length)];
    
    return muString;
}

@end
