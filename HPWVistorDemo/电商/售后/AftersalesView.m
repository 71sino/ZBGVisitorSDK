//
//  AftersalesView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/13.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import "AftersalesView.h"

@implementation AftersalesView
+ (instancetype) initCustomView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"AftersalesView" owner:nil options:nil];
    return nibView.lastObject;
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (_block) {
        _block();
    }
}

@end
