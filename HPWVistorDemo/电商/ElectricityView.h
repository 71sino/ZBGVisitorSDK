//
//  ElectricityView.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PresaleView.h"
#import "AftersalesView.h"

typedef void (^ElectricityViewBlock)();
@interface ElectricityView : UIView

@property (weak, nonatomic) IBOutlet UIButton *firstBuntton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (nonatomic, strong) PresaleView *preView;
@property (nonatomic, strong) AftersalesView *afterView;
@property (nonatomic, strong) ElectricityViewBlock block;
+ (instancetype) initConstomView;
@end
