//
//  UserThreeCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/4/9.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "UserThreeCell.h"

#define KH 90

@implementation UserThreeCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return KH;
}

- (void)cellDidLoad {
    [self.contentView addSubview:self.ticketBtn];
    [self.contentView addSubview:self.accountBtn];
    [self.contentView addSubview:self.wordBtn];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        NSArray *views = @[self.ticketBtn,self.accountBtn,self.wordBtn];
        [views autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:0 insetSpacing:NO];
        
        [views autoMatchViewsDimension:ALDimensionHeight];
        [views autoMatchViewsDimension:ALDimensionWidth];
        
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [[views firstObject] autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (IntegrationButton *)ticketBtn {
    if (!_ticketBtn) {
        _ticketBtn = [IntegrationButton newAutoLayoutView];
        [_ticketBtn.btnImageView setImage:[UIImage imageNamed:@"mine_collection"]];
        _ticketBtn.btnLabel.text = @"收藏";
//        [_ticketBtn.btnImageView setImage:[UIImage imageNamed:@"mine_collection"] forState:0];
//        _ticketBtn.backgroundColor = MLGrayColor;
        
        MLWeakSelf;
        [_ticketBtn addAction:^(UIButton *btn) {
            if (weakself.item.didClickBtn) {
                weakself.item.didClickBtn(45);
            }
        }];
        
        //设置可变文字
//        [_ticketBtn setAttributedTitle:[NSString setFirstPart:@"优惠券\n" firstFont:16 firstColor:MLBlackColor secondPart:@"3" secondFont:12 secongColor:MLLightGrayColor thirdPart:@"张" thirdFont:14 thirdColor:MLBlackColor] forState:0];
        
        //设置行间距
//        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
//        style.lineBreakMode = NSLineBreakByWordWrapping;
//        style.lineSpacing = 10;
//        _ticketBtn set
        
        //设置右侧分割线
//        CALayer *bottomBorder = [CALayer layer];
//        float height=KH-20*2;
//
//        bottomBorder.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/3, 20, 1, height);
//        bottomBorder.backgroundColor = MLLightGrayColor.CGColor;
//        [_ticketBtn.layer addSublayer:bottomBorder];
        
    }
    return _ticketBtn;
}

- (IntegrationButton *)accountBtn {
    if (!_accountBtn) {
        _accountBtn = [IntegrationButton  newAutoLayoutView];
        [_accountBtn.btnImageView setImage:[UIImage imageNamed:@"mine_mistake"]];
        _accountBtn.btnLabel.text = @"未处理违章";
//        [_accountBtn setImage:[UIImage imageNamed:@"mine_mistake"] forState:0];
        
        MLWeakSelf;
        [_accountBtn addAction:^(UIButton *btn) {
            if (weakself.item.didClickBtn) {
                weakself.item.didClickBtn(46);
            }
        }];
        
//        CALayer *bottomBorder = [CALayer layer];
//        float height=KH-20*2;
//        bottomBorder.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/3, 20, 1, height);
//        bottomBorder.backgroundColor = MLLightGrayColor.CGColor;
//        [_accountBtn.layer addSublayer:bottomBorder];
    }
    return _accountBtn;
}

- (IntegrationButton *)wordBtn {
    if (!_wordBtn) {
        _wordBtn = [IntegrationButton newAutoLayoutView];
        [_wordBtn.btnImageView setImage:[UIImage imageNamed:@"mine_wallet"]];
        _wordBtn.btnLabel.text = @"我的钱包";
//        [_wordBtn setImage:[UIImage imageNamed:@"mine_wallet"] forState:0];
        
        MLWeakSelf;
        [_wordBtn addAction:^(UIButton *btn) {
            if (weakself.item.didClickBtn) {
                weakself.item.didClickBtn(47);
            }
        }];
    }
    return _wordBtn;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
//    [self.ticketBtn setTitle:@"收藏" forState:0];
//    [self.accountBtn setTitle:@"未处理违章" forState:0];
//    [self.wordBtn setTitle:@"我的钱包" forState:0];
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
