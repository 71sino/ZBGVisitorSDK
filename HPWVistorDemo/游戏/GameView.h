//
//  GameView.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^GameViewBlock)();
@interface GameView : UIView
+ (instancetype) initCunstomView;
@property (nonatomic, strong) GameViewBlock block;
@end
