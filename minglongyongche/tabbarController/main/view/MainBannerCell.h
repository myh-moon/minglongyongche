//
//  MainBannerCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "CarDetailBannerItem.h"

@interface MainBannerCell : BaseCell<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *bannerScrollView;
@property (nonatomic,strong) UIPageControl *bannerPage;
@property (nonatomic,strong) UIButton *newsButton;

@property (nonatomic,strong) void (^didSelectedBanner)(NSInteger tag);

@property (nonatomic,strong) NSArray *bannerList;

@property (nonatomic,strong,readwrite) CarDetailBannerItem *item;

@end
