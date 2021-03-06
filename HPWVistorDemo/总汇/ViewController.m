//
//  ViewController.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#define kUIScreen_bounds_width  self.view.frame.size.width
#define kIPHONE5 ([UIScreen mainScreen].bounds.size.width > 320)
#define WS(weakSelf) __weak typeof(self)weakSelf = self;
#define WKDAlertMessage(__title__, __message__)     [[[UIAlertView alloc] initWithTitle:__title__       \
message:__message__     \
delegate:nil             \
cancelButtonTitle:@"确定"          \
otherButtonTitles:nil] show]


#import "ViewController.h"
#import "ElectricityView.h"
#import "SocialView.h"
#import "MedicalView.h"
#import "GameView.h"
#import "EducationView.h"
#import "Masonry.h"
#import "HPWVistor.h"
#import "CustomCell.h"
#import "CustomTableView.h"
#import "GameViewController.h"
@interface ViewController ()<HPWVistorDelegate>
@property (nonatomic, strong) CustomTableView *tableView;
@property (nonatomic, strong) ElectricityView *electricityView;
@property (nonatomic, strong) GameViewController *gameView2;
@property (nonatomic, strong) SocialView *socialView;
@property (nonatomic, strong) MedicalView *medicalView;
@property (nonatomic, strong) GameView *gameView;
@property (nonatomic, strong) EducationView *educationView;
@property (nonatomic, assign) BOOL isTap;
@property (nonatomic, strong) NSArray *dataSouce;
@property (nonatomic, strong) NSArray *dataImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *tabRightBtn;
@property (nonatomic,strong) UIButton *unReadNum;
@property (weak, nonatomic) IBOutlet UITextField *partnerUidTexf;

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[HPWVistor sharedVistor] queryUnreadNumMessageSucceed:^(NSInteger num) {
            NSLog(@"主动获取的未读数=%zd",num);
            [self vistorUnReadMessageNum:num];
        }];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    //设置代理
    [HPWVistor sharedVistor].delegate = self;


}
- (void)setNav{
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = 1;
    btn.hidden = NO;
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [btn setImage:[UIImage imageNamed:@"菜单-1"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 50, 40);
    UIBarButtonItem *baritem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    btn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = baritem;
    
    _unReadNum = [UIButton buttonWithType:UIButtonTypeCustom];
    _unReadNum.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [_unReadNum setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_unReadNum sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_unReadNum];
    
}
- (IBAction)setUserID:(id)sender {
    [[HPWVistor sharedVistor] setPartnerUid:self.partnerUidTexf.text];
    WKDAlertMessage(@"设置成功", @"");
    
}
- (IBAction)something1:(id)sender {
    [[HPWVistor sharedVistor] addTrajectoryInfo:@"1111111" pageTitle:@"访客发送的轨迹事件1" resolution:@"333333" sourceUrl:@"44444" result:^{
                WKDAlertMessage(@"设置事件1", @"成功");
    } fail:^{
                WKDAlertMessage(@"设置事件1", @"失败");
    }];
}
- (IBAction)something2:(id)sender {
    [[HPWVistor sharedVistor] addTrajectoryInfo:@"aaaaaa" pageTitle:@"访客发送的轨迹事件2" resolution:@"cccccc" sourceUrl:@"dddddde" result:^{
        WKDAlertMessage(@"设置事件2", @"成功");
    } fail:^{
        WKDAlertMessage(@"设置事件2", @"失败");
    }];
}
- (IBAction)clearGuiji:(UIButton *)sender{
    [[HPWVistor sharedVistor] clearTrajectoryInfo];
    WKDAlertMessage(@"清除轨迹成功", @"");
}






#pragma mark - HPWVistorDelegate

/**
 SDK收到了新消息
 */
- (void)vistorDidReceiveMessage:(NSString *)content{
    NSLog(@"收到了消息------------%@--",content);
}

/**
 访客端的消息的未读数
 */
- (void)vistorUnReadMessageNum:(NSInteger)num
{
    [_unReadNum setTitle:[NSString stringWithFormat:@"未读数=%zd",num] forState:UIControlStateNormal];
    [_unReadNum sizeToFit];
    
}

#pragma mark - 配置子控制器
- (void)initGameView2 {
    _gameView2 = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:[NSBundle mainBundle]];
    
    [self setCunstom:_gameView2.view];
    WS(weakSelf);
    _gameView2.block = ^(){
        [weakSelf gotoSDK];
    };
    [_gameView2.view layoutIfNeeded];
}

- (void) initElectricityView {
    _electricityView = [ElectricityView initConstomView];
    [self setCunstom:_electricityView];
    WS(weakSelf);
    _electricityView.block = ^(){
        [weakSelf gotoSDK];
    };
    [_electricityView layoutIfNeeded];
}

- (void) initSocialView {
    _socialView = [SocialView initCustomView];
    [self setCunstom:_socialView];
    WS(weakSelf);
    _socialView.block = ^(){
        [weakSelf gotoSDK];
    };
}
- (void)initMedicalView {
    _medicalView = [MedicalView initCunstomView];
    [self setCunstom: _medicalView];
    WS(weakSelf);
    _medicalView.block = ^() {
        [weakSelf gotoSDK];
    };
}
- (void) initEducationView {
    _educationView = [EducationView initCunstomView];
    [self setCunstom:_educationView];
    WS(weakSelf);
    _educationView.block = ^() {
        [weakSelf gotoSDK];
    };
}
-(void) initGameView {
    _gameView = [GameView initCunstomView];
    [self setCunstom:_gameView];
    WS(weakSelf);
    _gameView.block = ^() {
        [weakSelf gotoSDK];
    };
}
- (void)setCunstom:(UIView *)view {
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo (self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [view layoutIfNeeded];
}
- (IBAction)gotoSDK {
    //    3、弹出访客端界面
    [[HPWVistor sharedVistor] showView:self dismissCompletion:^{
        
    } errorFail:^{
        
    }];

}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            NSLog(@"类型按钮被点击");
            if (!_isTap) {
                [self describeTableView];
            }else {
                [self hideTableView];
            }
            _isTap = !_isTap;
            break;
        default:
            break;
    }
}
- (void)describeTableView {
    if (!_tableView) {
        CGFloat height;
        if (kIPHONE5) {
            height = self.dataSouce.count * 44;
        }else {
            height = self.dataSouce.count * 34;
        }
        CGRect frame = CGRectMake(kUIScreen_bounds_width - kUIScreen_bounds_width / 3 - 10, 0, kUIScreen_bounds_width / 3, height);
        _tableView = [[CustomTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.datasource = self.dataSouce;
        _tableView.dataImage = self.dataImage;
        [self.view insertSubview:_tableView atIndex:100];
    }else {
        [self.view insertSubview:_tableView atIndex:100];
    }
    [self showTableView];
     _tableView.hidden = NO;
    WS(weakSelf);
    _tableView.block = ^(NSInteger index) {
        [weakSelf hideTableView];
        _isTap = NO;
        switch (index) {
            case 0:
                if (weakSelf.electricityView) {
                    [weakSelf insterView:weakSelf.electricityView];
                }else {
                    [weakSelf initElectricityView];
                }
                break;
            case 1:
                if (weakSelf.medicalView) {
                    [weakSelf insterView:weakSelf.medicalView];
                }else {
                    [weakSelf initMedicalView];
                }
                break;
            case 2:
                if (weakSelf.gameView) {
                    [weakSelf insterView:weakSelf.gameView];
                }else {
                    [weakSelf initGameView];
                }
                break;
            case 3:
                if (weakSelf.socialView) {
                    [weakSelf insterView:weakSelf.socialView];
                }else {
                    [weakSelf initSocialView];
                }
                break;
            case 4:
                if (weakSelf.educationView) {
                    [weakSelf insterView:weakSelf.educationView];
                }else {
                    [weakSelf initEducationView];
                }break;
            case 5:
            {
                if (weakSelf.gameView2) {
                    [weakSelf insterView:weakSelf.gameView2.view];
                }else {
                    [weakSelf initGameView2];
                }
            }
                break;
            default:
                break;
        }
    };
}
- (void)showTableView {
    _tableView.alpha = 0;
    [UIView animateWithDuration:.5f animations:^{
        _tableView.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}
- (void)hideTableView {
    [UIView animateWithDuration:.5f animations:^{
        _tableView.alpha = 0;
    } completion:^(BOOL finished) {
        _tableView.hidden = YES; 
    }];
}
- (void) insterView:(UIView *)view {
    [UIView animateWithDuration:.5f animations:^{
        view.alpha = .999f;
    } completion:^(BOOL finished) {
        view.alpha = 1.0f;
        [self.view insertSubview:view atIndex:99];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSArray *)dataSouce {
    if (!_dataSouce) {
        _dataSouce = @[@"电商",@"医疗",@"游戏",@"社交",@"教育",@"游戏2"];
    }
    return _dataSouce;
}
- (NSArray *)dataImage {
    if (!_dataImage) {
        _dataImage = @[@"电商",@"医疗",@"游戏",@"社交",@"教育",@"游戏"];
    }
    return _dataImage;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
@end
