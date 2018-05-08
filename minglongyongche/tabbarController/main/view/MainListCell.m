//
//  MainListCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/16.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MainListCell.h"
#define BW  230
#define BH 200

@implementation MainListCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return BH+MLCellHeight;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    self.backgroundColor = MLBackGroundColor;
    
    [self.contentView addSubview:self.tiLabel];
    [self.contentView addSubview:self.actBtn];
    [self.contentView addSubview:self.listCollectionView];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.tiLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:middleSpacing];
        [self.tiLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];

        [self.actBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:middleSpacing];
        [self.actBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.tiLabel];
//
        [self.listCollectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
        [self.listCollectionView autoSetDimension:ALDimensionHeight toSize:BH];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UICollectionView *)listCollectionView {
    if (!_listCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(BW, BH);
        
        _listCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _listCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _listCollectionView.delegate = self;
        _listCollectionView.dataSource = self;
        _listCollectionView.backgroundColor = MLBackGroundColor;
        _listCollectionView.showsHorizontalScrollIndicator = NO;
        [_listCollectionView registerClass:[MainListCollectionViewCell  class] forCellWithReuseIdentifier:@"list"];
    }
    return _listCollectionView;
}

- (UILabel *)tiLabel {
    if (!_tiLabel) {
        _tiLabel = [UILabel newAutoLayoutView];
        _tiLabel.text = @"精选优车";
        _tiLabel.font = MLFont4;
        _tiLabel.textColor = MLBlackColor;
    }
    return _tiLabel;
}

- (UIButton *)actBtn {
    if (!_actBtn) {
        _actBtn = [UIButton newAutoLayoutView];
        [_actBtn setTitle:@"更多 " forState:0];
        _actBtn.titleLabel.font = MLFont3;
        [_actBtn setTitleColor:MLGrayColor forState:0];
        [_actBtn swapImage];
        [_actBtn setImage:[UIImage imageNamed:@"arrow_right"] forState:0];

        MLWeakSelf;
        [_actBtn addAction:^(UIButton *btn) {
            if (weakself.item.didSelectedBtn) {
                weakself.item.didSelectedBtn(66);
            }
        }];
    }
    return _actBtn;
}

#pragma mark - collectionviewcell delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.item.hotList.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainListCollectionViewCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"list" forIndexPath:indexPath];
    if (!collectionCell) {
        collectionCell = [[MainListCollectionViewCell alloc] init];
    }
    
    CarModel *model = self.item.hotList[indexPath.item];
    
    
    NSArray *array = [model.pic componentsSeparatedByString:@","]; //从字符A中分隔成2个元素的数组
    NSString *immm  = [NSString stringWithFormat:@"%@%@",MLBaseUrl,array[0]];  //汽车大图
    [collectionCell.carImageView sd_setImageWithURL:[NSURL URLWithString:immm]];
    collectionCell.carSignLabel.text = model.name;

    return collectionCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.item.didSelectedBtn) {
        self.item.didSelectedBtn(678);
    }
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    [self.listCollectionView reloadData];
    
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
