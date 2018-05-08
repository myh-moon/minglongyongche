//
//  CarDetailConfigCell.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/4.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseCell.h"
#import "IntegrationButton.h"
#import "ConfigCollectionCell.h"


#import "CarDetailConfigItem.h"

@interface CarDetailConfigCell : BaseCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *configLabel;

@property (nonatomic,strong) UICollectionView *configCollectionView;


//@property (nonatomic,strong) UICollectionViewCell *configBtn1;
//@property (nonatomic,strong) IntegrationButton *configBtn2;
//@property (nonatomic,strong) IntegrationButton *configBtn3;
//@property (nonatomic,strong) IntegrationButton *configBtn4;
//@property (nonatomic,strong) IntegrationButton *configBtn5;
//@property (nonatomic,strong) IntegrationButton *configBtn6;
//@property (nonatomic,strong) IntegrationButton *configBtn7;
//@property (nonatomic,strong) IntegrationButton *configBtn8;

@property (nonatomic,strong,readwrite) CarDetailConfigItem *item;

@end
