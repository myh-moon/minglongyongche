//
//  UIViewController+Blur.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"
#import "PullDatePickerView.h"
#import "SimpleDatePickerView.h"
#import "ShortBrandChooseView.h"

@interface UIViewController (Blur)<RETableViewManagerDelegate>

//短租列表条件选择
- (void) showBlurViewInView:(UIView *)view array:(NSArray *)titleArray top:(CGFloat)top finishBlock:(void(^)(NSString *name,NSString *cid))finishBlock;

//确认订单的地址选择
- (void) showBlurViewInView:(UIView *)view array:(NSArray *)titleArray  finishBlock:(void(^)(NSString *name))finishBlock;



//品牌选择（两个tableview）
- (void) showTwoBlurViewInView:(UIView *)view array:(NSArray *)brandArray top:(CGFloat)top finishBlock:(void(^)(NSString *name,NSString *childID))finishBlock;


- (void)hiddenBlurView;


//pickerview  日期格式yyyy-MM-dd EEEE H:mm
- (void) showPickerViewInView:(UIView *)view finishBlock:(void(^)(NSString *dateStr,NSDate *date))finishBlock;

- (void) showDatePickerViewInView:(UIView *)view finishBlock:(void(^)(NSString *dateStr,NSDate *date))finishBlock;


@end
