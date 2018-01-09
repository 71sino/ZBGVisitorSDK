//
//  EducationView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/12.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import "EducationView.h"

@implementation EducationView
+ (instancetype) initCunstomView {
    NSArray *nibView = [[NSBundle mainBundle] loadNibNamed:@"EducationView" owner:nil options:nil];
    return nibView.lastObject;
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (_block) {
        _block();
    }
}
@end
