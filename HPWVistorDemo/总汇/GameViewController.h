//
//  GameViewController.h
//  客服SDK_demo
//
//  Created by 谭建中 on 18/7/17.
//  Copyright © 2017年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ElectricityViewBlock)();

@interface GameViewController : UIViewController

@property (nonatomic, strong) ElectricityViewBlock block;

@end
