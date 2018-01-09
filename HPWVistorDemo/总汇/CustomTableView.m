//
//  CustomTableView.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/14.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//
#define kIPHONE5 ([UIScreen mainScreen].bounds.size.width > 320)
#import "CustomTableView.h"
#import "CustomCell.h"
@interface CustomTableView()<UITableViewDelegate,UITableViewDataSource>
@end
@implementation CustomTableView
- (instancetype) initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame: frame style:style]) {
        [self setTableInfo];
    }
    return self;
}
- (void) setTableInfo {
    self.delegate = self;
    self.dataSource = self;
    self.scrollEnabled = NO;
    self.hidden = NO;
    self.layer.cornerRadius = 4; 
    self.separatorStyle = UITableViewCellSelectionStyleNone;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (kIPHONE5) {
        return 44;
    }else {
        return 34;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [CustomCell cellWithTableView:tableView];
    cell.customLabel.text = self.datasource[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.7f];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.customImage.image = [UIImage imageNamed:self.dataImage[indexPath.row]];
    if (indexPath.row == self.datasource.count - 1) {
        cell.customView.hidden = YES;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_block) {
        _block(indexPath.row);
    }
}


@end
