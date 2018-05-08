//
//  ConfirmPhoneItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/24.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface ConfirmPhoneItem : RETableViewItem

@property (nonatomic,copy) NSString *leftTitle;
@property (nonatomic,copy) NSString *leftImage;
@property (nonatomic,copy) UIColor *leftColor;
@property (nonatomic,assign) CGFloat leftFont;
@property (nonatomic,copy) NSString *rightImage;

@property (nonatomic,assign) BOOL isHidden;  //是否隐藏花色分割线

- (instancetype) initWithLeftTitle:(NSString *)leftString leftImage:(NSString *)leftImage leftTextColor:(UIColor *)color leftTextFont:(CGFloat)font rightImage:(NSString *)rightImage hidden:(BOOL)isHidden;

@end
