//
//  GameView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import "GameView.h"

@implementation GameView

+ (instancetype) initCunstomView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"GameView" owner:nil options:nil];
    return nibView.lastObject;
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (_block) {
        _block();
    }
}

@end
