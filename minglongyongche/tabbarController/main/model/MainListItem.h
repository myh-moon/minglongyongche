//
//  MainListItem.h
//  minglongyongche
//
//  Created by jiamanu on 2018/4/18.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "BaseItem.h"
#import "CarModel.h"

@interface MainListItem : BaseItem

@property (nonatomic,strong) NSMutableArray *hotList;

@property (nonatomic,copy) NSString *carImage;
@property (nonatomic,copy) NSString *carTitle;

- (instancetype) initWithHotList:(NSArray *)hotArray;

//- (instancetype) initWithModel:(CarModel *)model;

//@property (nonatomic,strong,readwrite)

@end
