//
//  ShortBrandChooseView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShortBrandChooseView : UIView

@property (nonatomic,assign) BOOL didSetupConstraints;

//@property (nonatomic,strong) NSArray *brandArray;

@property (nonatomic,strong) RETableViewManager *firstManager;
@property (nonatomic,strong) UITableView *firstTableView;
@property (nonatomic,strong) NSLayoutConstraint *firstWidthConstraints;  //左边tableview 的宽度


@property (nonatomic,strong) RETableViewManager *secondManager;
@property (nonatomic,strong) UITableView *secondTableView;

@property (nonatomic,strong) void (^didSelectedBrand)(NSString *brandName,NSString *cid); //返回车名和对应的id

- (void)loadBrandData:(NSArray *)brandList;

@end
