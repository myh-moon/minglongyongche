//
//  MainListCollectionViewCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/20.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainListCollectionViewCell : UICollectionViewCell

@property (nonatomic,assign) BOOL didSetupConstraints;

@property (nonatomic,strong) UIImageView *carImageView;
@property (nonatomic,strong) UILabel *carSignLabel;

@end
