//
//  PresaleView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import "PresaleView.h"

@implementation PresaleView

+ (instancetype) initCustomView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"PresaleView" owner:nil options:nil];
    return nibView.lastObject;
}

- (IBAction)buttonClick:(UIButton *)sender {
    NSLog(@"block = %@",_block);
    if (_block) {
        _block();
    }
}

@end
