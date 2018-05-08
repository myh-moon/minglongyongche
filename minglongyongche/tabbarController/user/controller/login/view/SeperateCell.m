//
//  SeperateCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/25.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "SeperateCell.h"

@implementation SeperateCell

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.backgroundColor = MLBackGroundColor;
    self.separatorInset = MLSeparatorInset;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
