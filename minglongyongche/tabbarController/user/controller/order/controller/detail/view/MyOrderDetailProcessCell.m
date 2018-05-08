//
//  MyOrderDetailProcessCell.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailProcessCell.h"

@implementation MyOrderDetailProcessCell

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager {
    return 140;
}

- (void)cellDidLoad {
    [super cellDidLoad];
    
    self.separatorInset = MLSeparatorInset;
    
    [self.contentView addSubview:self.carStatusLabel];
    
    [self.contentView addSubview:self.processImageButton1];
    [self.contentView addSubview:self.processImageButton2];
    [self.contentView addSubview:self.processImageButton3];
    [self.contentView addSubview:self.processImageButton4];
    
    [self.contentView addSubview:self.processLabel1];
    [self.contentView addSubview:self.processLabel2];
    [self.contentView addSubview:self.processLabel3];
    [self.contentView addSubview:self.processLabel4];
    
    [self.contentView addSubview:self.lineImageView1];
    [self.contentView addSubview:self.lineImageView2];
    [self.contentView addSubview:self.lineImageView3];

    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.carStatusLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:middleSpacing];
        [self.carStatusLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:bigSpacing];
        
        //4张图片
        NSArray *views1 = @[self.processImageButton1,self.processImageButton2,self.processImageButton3,self.processImageButton4];
        [views1 autoMatchViewsDimension:ALDimensionWidth];
        [views1 autoMatchViewsDimension:ALDimensionHeight];
        [views1 autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:bigSpacing];
        
        [[views1 firstObject] autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
        [[views1 firstObject] autoSetDimensionsToSize:CGSizeMake(bigSpacing, bigSpacing)];
        [[views1 firstObject] autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.carStatusLabel withOffset:bigSpacing];
        
        [[views1 lastObject] autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
        
        
        //4个label
        NSArray *view2 = @[self.processLabel1,self.processLabel2,self.processLabel3,self.processLabel4];
        [view2 autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.processLabel1 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.processImageButton1];
        [self.processLabel1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.processImageButton1 withOffset:middleSpacing];
        
        [self.processLabel2 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.processImageButton2];
        
        [self.processLabel3 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.processImageButton3];

        [self.processLabel4 autoAlignAxis:ALAxisVertical toSameAxisOfView:self.processImageButton4];

        //3个分割线
        NSArray *views3 = @[self.lineImageView1,self.lineImageView2,self.lineImageView3];
        [views3 autoAlignViewsToAxis:ALAxisHorizontal];
        
        [self.lineImageView1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.processImageButton1];
        [self.lineImageView1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.processImageButton1 withOffset:smallSpacing];
        [self.lineImageView1 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.processImageButton2 withOffset:-smallSpacing];

        
        [self.lineImageView2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.processImageButton2 withOffset:smallSpacing];
        [self.lineImageView2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.processImageButton3 withOffset:-smallSpacing];
        
        [self.lineImageView3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.processImageButton3 withOffset:smallSpacing];
        [self.lineImageView3 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.processImageButton4 withOffset:-smallSpacing];
        
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (UILabel *)carStatusLabel {
    if (!_carStatusLabel) {
        _carStatusLabel = [UILabel newAutoLayoutView];
        _carStatusLabel.text = @"用车状态：";
        _carStatusLabel.textColor = MLBlackColor;
        _carStatusLabel.font = MLFont4;
    }
    return _carStatusLabel;
}

- (UIButton *)processImageButton1 {
    if (!_processImageButton1) {
        _processImageButton1 = [UIButton newAutoLayoutView];
    }
    return _processImageButton1;
}

- (UIButton *)processImageButton2 {
    if (!_processImageButton2) {
        _processImageButton2 = [UIButton newAutoLayoutView];
    }
    return _processImageButton2;
}

- (UIButton *)processImageButton3 {
    if (!_processImageButton3) {
        _processImageButton3 = [UIButton newAutoLayoutView];
    }
    return _processImageButton3;
}

- (UIButton *)processImageButton4 {
    if (!_processImageButton4) {
        _processImageButton4 = [UIButton newAutoLayoutView];
    }
    return _processImageButton4;
}

- (UILabel *)processLabel1 {
    if (!_processLabel1) {
        _processLabel1 = [UILabel newAutoLayoutView];
        _processLabel1.font = MLFont3;
    }
    return _processLabel1;
}

- (UILabel *)processLabel2 {
    if (!_processLabel2) {
        _processLabel2 = [UILabel newAutoLayoutView];
        _processLabel2.font = MLFont3;
    }
    return _processLabel2;
}

- (UILabel *)processLabel3 {
    if (!_processLabel3) {
        _processLabel3 = [UILabel newAutoLayoutView];
        _processLabel3.font = MLFont3;
    }
    return _processLabel3;
}

- (UILabel *)processLabel4 {
    if (!_processLabel4) {
        _processLabel4 = [UILabel newAutoLayoutView];
        _processLabel4.font = MLFont3;
    }
    return _processLabel4;
}

- (UIImageView *)lineImageView1 {
    if (!_lineImageView1) {
        _lineImageView1 = [UIImageView newAutoLayoutView];
    }
    return _lineImageView1;
}

- (UIImageView *)lineImageView2 {
    if (!_lineImageView2) {
        _lineImageView2 = [UIImageView newAutoLayoutView];
    }
    return _lineImageView2;
}

- (UIImageView *)lineImageView3 {
    if (!_lineImageView3) {
        _lineImageView3 = [UIImageView newAutoLayoutView];
    }
    return _lineImageView3;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    
    NSInteger sssss = [self.item.status integerValue];
    
    switch (sssss) {
        case 0:{
            [self.processImageButton1 setImage:[UIImage imageNamed:@"order_current"] forState:0];
            self.processLabel1.text = @"订单未付款";
            self.processLabel1.textColor = MLOrangeColor;
            
            [self.processImageButton2 setImage:[UIImage imageNamed:@"order_will"] forState:0];
            self.processLabel2.text = @"待取车";
            self.processLabel2.textColor = MLLightGrayColor;
            
            [self.processImageButton3 setImage:[UIImage imageNamed:@"order_will"] forState:0];
            self.processLabel3.text = @"未还车";
            self.processLabel3.textColor = MLLightGrayColor;
            
            [self.processImageButton4 setImage:[UIImage imageNamed:@"order_will"] forState:0];
            self.processLabel4.text = @"订单未完成";
            self.processLabel4.textColor = MLLightGrayColor;
            
            [self.lineImageView1 setImage:[UIImage imageNamed:@"xuxian_01"]];
            [self.lineImageView2 setImage:[UIImage imageNamed:@"xuxian_02"]];
            [self.lineImageView3 setImage:[UIImage imageNamed:@"xuxian_02"]];
        }
            break;
        case 1:{
            [self.processImageButton1 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
            self.processLabel1.text = @"订单已付款";
            self.processLabel1.textColor = MLOrangeColor;
            
            [self.processImageButton2 setImage:[UIImage imageNamed:@"order_current"] forState:0];
            self.processLabel2.text = @"待取车";
            self.processLabel2.textColor = MLOrangeColor;
            
            [self.processImageButton3 setImage:[UIImage imageNamed:@"order_will"] forState:0];
            self.processLabel3.text = @"未还车";
            self.processLabel3.textColor = MLLightGrayColor;
            
            [self.processImageButton4 setImage:[UIImage imageNamed:@"order_will"] forState:0];
            self.processLabel4.text = @"订单未完成";
            self.processLabel4.textColor = MLLightGrayColor;
            
            [self.lineImageView1 setImage:[UIImage imageNamed:@"shixian"]];
            [self.lineImageView2 setImage:[UIImage imageNamed:@"xuxian_01"]];
            [self.lineImageView3 setImage:[UIImage imageNamed:@"xuxian_02"]];
        }
            
            break;
        case 2:{
            [self.processImageButton1 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
            self.processLabel1.text = @"订单已付款";
            self.processLabel1.textColor = MLOrangeColor;
            
            [self.processImageButton2 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
            self.processLabel2.text = @"已取车";
            self.processLabel2.textColor = MLOrangeColor;
            
            [self.processImageButton3 setImage:[UIImage imageNamed:@"order_current"] forState:0];
            self.processLabel3.text = @"未还车";
            self.processLabel3.textColor = MLOrangeColor;
            
            [self.processImageButton4 setImage:[UIImage imageNamed:@"order_will"] forState:0];
            self.processLabel4.text = @"订单未完成";
            self.processLabel4.textColor = MLLightGrayColor;
            
            [self.lineImageView1 setImage:[UIImage imageNamed:@"shixian"]];
            [self.lineImageView2 setImage:[UIImage imageNamed:@"shixian"]];
            [self.lineImageView3 setImage:[UIImage imageNamed:@"xuxian_01"]];
        }
            break;
        case 3:{
            [self.processImageButton1 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
            self.processLabel1.text = @"订单已付款";
            self.processLabel1.textColor = MLOrangeColor;
            
            [self.processImageButton2 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
            self.processLabel2.text = @"已取车";
            self.processLabel2.textColor = MLOrangeColor;
            
            [self.processImageButton3 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
            self.processLabel3.text = @"已还车";
            self.processLabel3.textColor = MLOrangeColor;
            
            [self.processImageButton4 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
            self.processLabel4.text = @"订单已完成";
            self.processLabel4.textColor = MLLightGrayColor;
            
            [self.lineImageView1 setImage:[UIImage imageNamed:@"shixian"]];
            [self.lineImageView2 setImage:[UIImage imageNamed:@"shixian"]];
            [self.lineImageView3 setImage:[UIImage imageNamed:@"shixian"]];
        }
            
            break;
//        case 4:{
//            [self.processImageButton1 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
//            self.processLabel1.text = @"订单已付款";
//            self.processLabel1.textColor = MLOrangeColor;
//
//            [self.processImageButton2 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
//            self.processLabel2.text = @"已取车";
//            self.processLabel2.textColor = MLOrangeColor;
//
//            [self.processImageButton3 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
//            self.processLabel3.text = @"已还车";
//            self.processLabel3.textColor = MLOrangeColor;
//
//            [self.processImageButton4 setImage:[UIImage imageNamed:@"order_complete"] forState:0];
//            self.processLabel4.text = @"订单已完成";
//            self.processLabel4.textColor = MLOrangeColor;
//
//            [self.lineImageView1 setImage:[UIImage imageNamed:@"shixian"]];
//            [self.lineImageView2 setImage:[UIImage imageNamed:@"shixian"]];
//            [self.lineImageView3 setImage:[UIImage imageNamed:@"shixian"]];
//        }
//            break;
        default:
            break;
    }
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
