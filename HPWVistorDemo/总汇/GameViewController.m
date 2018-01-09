//
//  GameViewController.m
//  客服SDK_demo
//
//  Created by 谭建中 on 18/7/17.
//  Copyright © 2017年 Tony jaa. All rights reserved.
//

#import "GameViewController.h"
#import "AppDelegate.h"
@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *gameBgView;
@property (weak, nonatomic) IBOutlet UIButton *coneteServer;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gameBgView.contentMode = UIViewContentModeCenter;

    [self.coneteServer addTarget:self action:@selector(coneteServer:) forControlEvents:UIControlEventTouchUpInside];
   
   
//    self.coneteServer.backgroundColor = color227shallblue;
    //关键语句
    self.coneteServer.layer.cornerRadius = 2.0;//2.0是圆角的弧度，根据需求自己更改
    self.coneteServer.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);//设置边框颜色
    self.coneteServer.layer.borderWidth = 1.0f;//设置边框颜色
}
- (void)coneteServer:(UIButton *)btn
{
    if (_block) {
        _block();
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
