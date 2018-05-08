//
//  NewsTypeItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>

@interface NewsTypeItem  : RETableViewItem

@property (nonatomic,copy) NSString *imageStr;
@property (nonatomic,copy) NSString *titleStr;
@property (nonatomic,copy) NSString *subtitleStr;
@property (nonatomic,copy) NSString *textStr;

//+ (id) initWithModel:(id) model;
- (instancetype) initWithTitleImage:(NSString *)titleImageString title:(NSString *)titleString subtitle:(NSString *)subtitleString text:(NSString *)textString;

@end
