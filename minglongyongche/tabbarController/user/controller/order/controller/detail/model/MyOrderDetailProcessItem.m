//
//  MyOrderDetailProcessItem.m
//  minglongyongche
//
//  Created by jiamanu on 2018/5/3.
//  Copyright © 2018年 minglongkeji. All rights reserved.
//

#import "MyOrderDetailProcessItem.h"

@implementation MyOrderDetailProcessItem

- (instancetype)initWithProcessStatus:(NSString *)status {
    self = [super init];
    if (self) {
        self.status = status;
        
//        switch ([status integerValue]) {
//            case 0:{
//                self.processText1 = @"订单未付款";
//                self.processImage1 = @"order_current";
//                self.processColor1 = MLOrangeColor;
//            }
//                break;
//            case 1:
//                self.processText1 = @"订单已付款";
//                self.processImage1 = @"order_complete";
//                self.processColor1 = MLOrangeColor;
//                break;
//            case 2:
//                break;
//            case 3:
//                break;
//            case 4:
//                break;
//            case 5:
//                break;
//            case 6:
//                break;
//            case 7:
//                break;
//            default:
//                break;
//        }
        
    }
    return self;
}



@end
