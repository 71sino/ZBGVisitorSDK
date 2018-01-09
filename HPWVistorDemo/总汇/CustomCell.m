//
//  CustomCell.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/13.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
+ (instancetype) cellWithTableView:(UITableView *)tableView {
    static NSString *cellIdentifier = @"CustomCell";
    BOOL nibRegistered = NO;
    if (!nibRegistered) {
        UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
        nibRegistered = YES;
    }
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] lastObject];
    }
    return cell;
}
@end
