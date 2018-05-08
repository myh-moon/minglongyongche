//
//  UIViewController+Blur.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "UIViewController+Blur.h"

@implementation UIViewController (Blur)

- (void)showBlurViewInView:(UIView *)view array:(NSArray *)titleArray top:(CGFloat)top finishBlock:(void (^)(NSString *name, NSString *cid))finishBlock {
    UIView *tagView = [self.view viewWithTag:999];
    
    PullTableView *pullTableView = [self.view viewWithTag:998];
    
    if (!tagView) {
        tagView  = [UIView newAutoLayoutView];
        tagView.backgroundColor = [UIColor colorWithRed:0.2510 green:0.2510 blue:0.2510 alpha:0.5];
        tagView.tag = 999;
        
        if (!view) {
            view = self.view;
        }
        
        [view addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [tagView autoPinToTopLayoutGuideOfViewController:self withInset:top];
        
        pullTableView = [PullTableView newAutoLayoutView];
        [tagView addSubview:pullTableView];
        
        [pullTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:tagView];
        [pullTableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:tagView];
        [pullTableView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:tagView];
        [pullTableView autoSetDimension:ALDimensionHeight toSize:titleArray.count * 40];
        
        [pullTableView loadAllData:titleArray];
    }
    
        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
            UIControl *tapControl = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl];
        
            [tapControl autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
            [tapControl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:pullTableView];
            
            [tapControl addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
        }

    if (finishBlock) {
        [pullTableView setDidSelectedItem:^(NSString *text, NSString *cid) {
            [tagView removeFromSuperview];
            finishBlock(text,cid);
        }];
    }
}

- (void)showBlurViewInView:(UIView *)view array:(NSArray *)titleArray finishBlock:(void (^)(NSString *))finishBlock {
    UIView *tagView = [self.view viewWithTag:999];
    PullTableView *pullTableView = [self.view viewWithTag:998];
    
    if (!tagView) {
        tagView  = [UIView newAutoLayoutView];
        tagView.backgroundColor = [UIColor colorWithRed:0.2510 green:0.2510 blue:0.2510 alpha:0.5];
        tagView.tag = 999;
        
        if (!view) {
            view = self.view;
        }
        
        [view addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        pullTableView = [PullTableView newAutoLayoutView];
        pullTableView.signType = @"地址";
        [tagView addSubview:pullTableView];
        
        [pullTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:tagView];
        [pullTableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:tagView];
        [pullTableView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:tagView];
        [pullTableView autoSetDimension:ALDimensionHeight toSize:titleArray.count * 40];
        
        [pullTableView loadAllData:titleArray];
    }
    
    if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
        UIControl *tapControl = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl];
        
        [tapControl autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [tapControl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:pullTableView];
        
        [tapControl addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (finishBlock) {
        [pullTableView setDidSelectedItem:^(NSString *text, NSString *cid) {
            [tagView removeFromSuperview];
            finishBlock(text);
        }];
    }
}

- (void)showBlurViewWithArray:(NSArray *)titleArray top:(CGFloat)height {
    
}

- (void)hiddenBlurView {
    UIView *tagView = [self.view viewWithTag:999];
    if (tagView) {
        [tagView removeFromSuperview];
    }
}


- (void)showPickerViewInView:(UIView *)view finishBlock:(void (^)(NSString *, NSDate *))finishBlock
{
    UIView *tagView = [self.view viewWithTag:999];
    PullDatePickerView *pickerView = [self.view viewWithTag:998];
    
    if (!tagView) {
        tagView  = [UIView newAutoLayoutView];
        tagView.backgroundColor = [UIColor colorWithRed:0.2510 green:0.2510 blue:0.2510 alpha:0.5];
        tagView.tag = 999;
        
        if (!view) {
            view = self.view;
        }
        
        [view addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
        
        pickerView = [PullDatePickerView newAutoLayoutView];
        [tagView addSubview:pickerView];
        
        [pickerView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:tagView];
        [pickerView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:tagView];
        [pickerView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:tagView];
        [pickerView autoSetDimension:ALDimensionHeight toSize:250];
    }
    
    if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
        UIControl *tapControl = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl];
        
        [tapControl autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
        [tapControl autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:pickerView];
        
        [tapControl addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (finishBlock) {
        
        [pickerView setDidSelectedDate:^(NSString *dateStr, NSDate *date) {
            [tagView removeFromSuperview];
            finishBlock(dateStr,date);
//            finishBlock
        }];
    }
    
}

- (void)showDatePickerViewInView:(UIView *)view finishBlock:(void (^)(NSString *, NSDate *))finishBlock {
        UIView *tagView = [self.view viewWithTag:999];
        SimpleDatePickerView *pickerView = [self.view viewWithTag:998];
    
        if (!tagView) {
            tagView  = [UIView newAutoLayoutView];
            tagView.backgroundColor = [UIColor colorWithRed:0.2510 green:0.2510 blue:0.2510 alpha:0.5];
            tagView.tag = 999;
            
            if (!view) {
                view = self.view;
            }
            
            [view addSubview:tagView];
            [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
            
            pickerView = [SimpleDatePickerView newAutoLayoutView];
            [tagView addSubview:pickerView];
            
            [pickerView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:tagView];
            [pickerView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:tagView];
            [pickerView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:tagView];
            [pickerView autoSetDimension:ALDimensionHeight toSize:250];
        }
        
        if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
            UIControl *tapControl = [UIControl newAutoLayoutView];
            [tagView addSubview:tapControl];
            
            [tapControl autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeBottom];
            [tapControl autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:pickerView];
            
            [tapControl addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
        }
        
        if (finishBlock) {
            
            [pickerView setDidSelectedDate:^(NSString *dateStr, NSDate *date) {
                [tagView removeFromSuperview];
                finishBlock(dateStr,date);
                //            finishBlock
            }];
        }
}

- (void)showTwoBlurViewInView:(UIView *)view array:(NSArray *)brandArray top:(CGFloat)top finishBlock:(void (^)(NSString *, NSString *))finishBlock {
    UIView *tagView = [self.view viewWithTag:999];
    
    ShortBrandChooseView *brandTableView = [self.view viewWithTag:998];
    
    if (!tagView) {
        tagView  = [UIView newAutoLayoutView];
        tagView.backgroundColor = [UIColor colorWithRed:0.2510 green:0.2510 blue:0.2510 alpha:0.5];
        tagView.tag = 999;
        
        if (!view) {
            view = self.view;
        }
        
        [view addSubview:tagView];
        [tagView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [tagView autoPinToTopLayoutGuideOfViewController:self withInset:top];
        
        brandTableView = [ShortBrandChooseView newAutoLayoutView];
        [tagView addSubview:brandTableView];
        
        [brandTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:tagView];
        [brandTableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:tagView];
        [brandTableView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:tagView];
        [brandTableView autoSetDimension:ALDimensionHeight toSize:brandArray.count * 40];
        
        [brandTableView loadBrandData:brandArray];
    }
    
    if (tagView) {//在空白处添加UIControl，点击空白处，使页面消失
        UIControl *tapControl = [UIControl newAutoLayoutView];
        [tagView addSubview:tapControl];
        
        [tapControl autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [tapControl autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:brandTableView];
        
        [tapControl addTarget:self action:@selector(hiddenBlurView) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (finishBlock) {
        [brandTableView setDidSelectedBrand:^(NSString *text, NSString *childID) {
            [tagView removeFromSuperview];
            finishBlock(text,childID);
        }];
    }
}


@end
