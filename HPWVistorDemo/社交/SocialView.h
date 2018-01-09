//
//  SocialView.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/8.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SocialViewBlock)();
@interface SocialView : UIView
@property (nonatomic, strong) SocialViewBlock block;
+ (instancetype) initCustomView;
@end
