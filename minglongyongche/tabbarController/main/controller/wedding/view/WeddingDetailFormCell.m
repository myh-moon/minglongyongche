//
//  WeddingDetailFormCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/13.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "WeddingDetailFormCell.h"

@implementation WeddingDetailFormCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 114;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    [self.contentView addSubview:self.formCollectionView];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
       
        [self.formCollectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, bigSpacing, bigSpacing, bigSpacing)];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UICollectionView *)formCollectionView {
    if (!_formCollectionView) {
        
        CGFloat wi = (MLWindowWidth-bigSpacing * 2 - 1)/2;
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(wi, 30);
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 1;
        _formCollectionView.translatesAutoresizingMaskIntoConstraints = YES;
        _formCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _formCollectionView.delegate = self;
        _formCollectionView.dataSource = self;
        _formCollectionView.backgroundColor = MLLightGrayColor;
        _formCollectionView.layer.borderColor = MLBlackColor.CGColor;
        _formCollectionView.layer.borderWidth = 1;
        
        [_formCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _formCollectionView;
}

#pragma mark - datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
//    if (!cell) {
//        cell = [[DetailCollectionViewCell alloc] init];
//    }
    
    cell.backgroundColor = MLWhiteColor;
//    cell.textLabel.text = @"品牌";
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",(long)indexPath.item);
}

- (void)cellWillAppear {
    [super cellWillAppear];
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
