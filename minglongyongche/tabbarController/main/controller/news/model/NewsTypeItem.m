//
//  NewsTypeItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/8.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "NewsTypeItem.h"

@implementation NewsTypeItem

- (instancetype)initWithTitleImage:(NSString *)titleImageString title:(NSString *)titleString subtitle:(NSString *)subtitleString text:(NSString *)textString {
    self = [super init];
    if (self) {
        
        self.imageStr = titleImageString;
        self.titleStr = titleString;
        self.subtitleStr= subtitleString;
        self.textStr = textString;
        
    }
    return self;
}

@end
