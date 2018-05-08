//
//  MainListCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "MainListCollectionViewCell.h"
//#import "RecommendView.h"
#import "MainListItem.h"

@interface MainListCell : BaseCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *tiLabel;
@property (nonatomic,strong) UIButton *actBtn;

@property (nonatomic,strong) UICollectionView *listCollectionView;

//@property (nonatomic,strong) UICollectionViewCell *collectionCell;

//@property (nonatomic,strong) NSMutableArray *signArray;

@property (nonatomic,strong,readwrite) MainListItem *item;

@end
