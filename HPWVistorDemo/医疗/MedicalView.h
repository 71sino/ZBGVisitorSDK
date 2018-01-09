//
//  MedicalView.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MedicalViewBlock)();
@interface MedicalView : UIView
+ (instancetype) initCunstomView;
@property (nonatomic, strong) MedicalViewBlock block;
@end
