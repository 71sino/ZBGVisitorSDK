//
//  AppDelegate.m
//  客服SDK_demo
//
//  Created by Tonyjaa on 16/6/7.
//  Copyright © 2016年 Tony jaa. All rights reserved.
//

#import "AppDelegate.h"
#import "HPWVistor.h"
#import "UIImage+HPWTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        //2、注册公司信息（这个信息需要登陆管理中心->APP接入 注册信息）
//    [[HPWVistor sharedVistor] registerCommpanyCode:@"114716" appkey:@"7a9abab2-8c22-49a8-86ec-90c516f982d1"];
    
    //运营对外使用的公司代号
//    [[HPWVistor sharedVistor] registerCommpanyCode:@"192589" appkey:@"34927760-e32f-4d5d-9556-c2c8b44b400b" environment:HPWEnvironmentTypeRelease];
//
    //蓝海金融
//    [[HPWVistor sharedVistor] registerCommpanyCode:@"114547" appkey:@"a0442a8a-a66e-4ad2-a947-cbdd6c99f1bf" environment:HPWEnvironmentTypeRelease];
//
    
    [[HPWVistor sharedVistor] registerCommpanyCode:@"144772" appkey:@"147021056165453" environment:HPWEnvironmentTypeRelease];

    
//    [[HPWVistor sharedVistor] registerCommpanyCode:@"128212" appkey:@"6868ca56-3740-4ab1-aa41-d827fa617540" environment:HPWEnvironmentTypeRelease];
    //外网预发布13322
//        [[HPWVistor sharedVistor] registerCommpanyCode:@"13322" appkey:@"98e8d298-02dc-4963-bbc9-0152a6cdc6ca" environment:HPWEnvironmentTypePrepareRelease];
    
//          [[HPWVistor sharedVistor] registerCommpanyCode:@"141205" appkey:@"6f367770-0838-4ea0-9073-13b9c7fb1263"];
        
    //3、设置主题色
    [self setupNavigationBar];
    return YES;
}
- (void)setupNavigationBar {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage visitor_imageWithColor:color227shallblue] forBarMetrics:UIBarMetricsDefault];
    if( [[UIDevice currentDevice].systemVersion doubleValue]>=8.0f&&[UINavigationBar conformsToProtocol:@protocol(UIAppearanceContainer)]) {
        [[UINavigationBar appearance] setTranslucent:NO];
    }
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           nil, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18], NSFontAttributeName, nil]];
}

@end
