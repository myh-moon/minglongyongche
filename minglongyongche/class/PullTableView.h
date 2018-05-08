//
//  PullTableView.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/12.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PullTableView : UITableView<RETableViewManagerDelegate>

@property (nonatomic,strong) RETableViewManager *manager;

@property (nonatomic,copy) NSString *signType; //标记

@property (nonatomic,strong) void (^didSelectedItem)(NSString *text,NSString *cid);

- (void) loadAllData : (NSArray *)array ;


@end
