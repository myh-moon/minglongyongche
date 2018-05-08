//
//  WordCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/10.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "WordItem.h"

@interface WordCell : RETableViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UITextField *singleTextField;

@property (nonatomic,strong,readwrite) WordItem *item;

@end
