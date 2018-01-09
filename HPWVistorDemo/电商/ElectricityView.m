//
//  ElectricityView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//
/**
 *  电商界面e
 */

#import "ElectricityView.h"
#import "Masonry.h"
@implementation ElectricityView
+ (instancetype) initConstomView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"ElectricityView" owner:nil options:nil];
    return nibView.lastObject;
}
- (void)awakeFromNib {
    [self addPresaleView];
}
- (IBAction)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self.firstBuntton setBackgroundImage:[UIImage imageNamed:@"蓝色背景"] forState:UIControlStateNormal];
            [self.firstBuntton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.secondButton setBackgroundImage:nil forState:UIControlStateNormal];
            [self.secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (_preView) {
                [self insertSubview:_afterView atIndex:0];
                [self insertSubview:_preView atIndex:1];
            }else {
                [self addPresaleView];
            }
            break;
        default:
            [self.secondButton setBackgroundImage:[UIImage imageNamed:@"蓝色背景"] forState:UIControlStateNormal];
            [self.secondButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.firstBuntton setBackgroundImage:nil forState:UIControlStateNormal];
            [self.firstBuntton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (_afterView) {
                [self insertSubview:_preView atIndex:0];
                [self insertSubview:_afterView atIndex:1];
            }else {
                [self addAftersalesView];
            }
            break;
    }
}
- (void)addAftersalesView {
    __weak typeof(self)weakSelf = self;
    _afterView = [AftersalesView initCustomView];
    [self addCustomView:_afterView];
    _afterView.block = ^() {
        if (weakSelf.block) {
            weakSelf.block();
        }
    };
}
- (void)addPresaleView {
    __weak typeof(self)weakSelf = self;
    _preView = [PresaleView initCustomView];
    [self addCustomView:_preView];
    _preView.block = ^ () {
    if (weakSelf.block) {
        weakSelf.block();
    }
    };
}
- (void) addCustomView:(UIView *)view {
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo (self).with.insets(UIEdgeInsetsMake(54, 0, 0, 0));
    }];
    [view layoutIfNeeded];
}
@end
