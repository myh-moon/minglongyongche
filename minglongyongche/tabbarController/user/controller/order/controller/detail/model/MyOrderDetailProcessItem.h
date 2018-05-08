//
//  MyOrderDetailProcessItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface MyOrderDetailProcessItem : RETableViewItem

@property (nonatomic,copy) NSString *status;

@property (nonatomic,copy) NSString *processText1;
@property (nonatomic,copy) NSString *processImage1;
@property (nonatomic,copy) UIColor *processColor1;

@property (nonatomic,copy) NSString *processText2;
@property (nonatomic,copy) NSString *processImage2;
@property (nonatomic,copy) UIColor *processColor2;

@property (nonatomic,copy) NSString *processText3;
@property (nonatomic,copy) NSString *processImage3;
@property (nonatomic,copy) UIColor *processColor3;

@property (nonatomic,copy) NSString *processText4;
@property (nonatomic,copy) NSString *processImage4;
@property (nonatomic,copy) UIColor *processColor4;

@property (nonatomic,copy) NSString *LineprocessImage1;
@property (nonatomic,copy) NSString *LineprocessImage2;
@property (nonatomic,copy) NSString *LineprocessImage3;


- (instancetype) initWithProcessStatus:(NSString *)status;

@end
