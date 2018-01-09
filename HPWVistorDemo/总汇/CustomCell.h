//
//  CustomCell.h
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/13.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *customImage;
@property (weak, nonatomic) IBOutlet UILabel *customLabel;
@property (weak, nonatomic) IBOutlet UIView *customView;
+ (instancetype) cellWithTableView:(UITableView *)tableView;
@end
