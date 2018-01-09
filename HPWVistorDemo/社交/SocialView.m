//
//  SocialView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/8.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import "SocialView.h"

@implementation SocialView

+ (instancetype) initCustomView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"SocialView" owner:nil options:nil];
    return nibView.lastObject;
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (_block) {
        _block();
    }
}
@end
