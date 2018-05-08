//
//  WeddingDetailFormCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "DetailCollectionViewCell.h"
#import "CarOrderItem.h"

@interface WeddingDetailFormCell : BaseCell <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *formCollectionView;

@property (nonatomic,strong) void (^didSelectedIItem)(NSInteger itemTag);

@property (nonatomic,strong,readwrite) CarOrderItem *item;

@end
