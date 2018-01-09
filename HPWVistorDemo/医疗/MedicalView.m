//
//  MedicalView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//
/**
 *  医疗界面
 *
 *  @return 
 */
#import "MedicalView.h"

@implementation MedicalView
+ (instancetype)initCunstomView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"MedicalView" owner:nil options:nil];
    return nibView.firstObject;
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (_block) {
        _block();
    }
}

@end
