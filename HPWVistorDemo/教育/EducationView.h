//
//  EducationView.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/12.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^EducationViewBlock)();
@interface EducationView : UIView

@property (nonatomic, strong) EducationViewBlock block;
+ (instancetype) initCunstomView;
@end
