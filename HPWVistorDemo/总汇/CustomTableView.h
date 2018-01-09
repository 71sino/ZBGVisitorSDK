//
//  CustomTableView.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/14.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CustomTableViewBlock)(NSInteger index);
@interface CustomTableView : UITableView
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, strong) NSArray *dataImage;
@property (nonatomic, strong) CustomTableViewBlock block;
@end
