//
//  ShortBrandChooseView.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/2.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "ShortBrandChooseView.h"
#import "ConditionModel.h"
#import "ConditionChildModel.h"

@implementation ShortBrandChooseView

- (instancetype)initWithFrame:(CGRect)frame {
   self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.firstTableView];
        [self addSubview:self.secondTableView];
        
        
        [self setNeedsUpdateConstraints];
        
        self.firstWidthConstraints = [self.firstTableView autoSetDimension:ALDimensionWidth toSize:MLWindowWidth];
        
        self.firstManager = [[RETableViewManager alloc] initWithTableView:self.firstTableView];
        
        
        self.secondManager = [[RETableViewManager alloc] initWithTableView:self.secondTableView];
    }
    
    return self;
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.firstTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.firstTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        [self.firstTableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self];

        [self.secondTableView autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self];
        [self.secondTableView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];
        [self.secondTableView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
        [self.secondTableView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.firstTableView];

        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UITableView *)firstTableView {
    if (!_firstTableView) {
        _firstTableView = [UITableView newAutoLayoutView];
        _firstTableView.tableFooterView = [UIView new];
    }
    return _firstTableView;
}

- (UITableView *)secondTableView {
    if (!_secondTableView) {
        _secondTableView = [UITableView newAutoLayoutView];
        _secondTableView.tableFooterView = [UIView new];
    }
    return _secondTableView;
}

- (void)loadBrandData:(NSArray *)brandList {
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.firstManager addSection:section];
    
    MLWeakSelf;
    for (NSInteger i=0; i<brandList.count; i++) {
        
        ConditionModel *conditionModel = brandList[i];
        
        RETableViewItem *item1 = [[RETableViewItem alloc] initWithTitle:conditionModel.name];
        item1.selectionHandler = ^(id item) {
            weakself.firstWidthConstraints.constant = MLWindowWidth/2;
            [weakself setupSecondTableViewWithArray:conditionModel.child brandName:conditionModel.name];
            [weakself.secondTableView reloadData];
        };
        [section addItem:item1];
    }
}

- (void) setupSecondTableViewWithArray:(NSArray *)secondArray brandName:(NSString *)brand {
    
    [self.secondManager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    section.footerHeight = 0;
    section.headerHeight = 0;
    [self.secondManager addSection:section];
    
    MLWeakSelf;
    for(NSInteger i=0; i<secondArray.count; i++) {
        
        ConditionChildModel *childModel = secondArray[i];
        
        RETableViewItem *item2 = [[RETableViewItem alloc] initWithTitle:childModel.name];
        item2.selectionHandler = ^(id item) {
            if (weakself.didSelectedBrand) {
                NSString *comName = [NSString stringWithFormat:@"%@%@",brand,childModel.name];
                weakself.didSelectedBrand(comName, childModel.childID);
            }
        };
        [section addItem:item2];
    }
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
