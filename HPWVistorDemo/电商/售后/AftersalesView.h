//
//  AftersalesView.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/13.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^AftersalesViewBlock)();
@interface AftersalesView : UIView
@property (nonatomic, strong) AftersalesViewBlock block;
+ (instancetype) initCustomView;
@end
