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
#import <LYTSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    [[HPWVistor sharedVistor] registerCommpanyCode:@"144772" appkey:@"147021056165453" environment:HPWEnvironmentTypeRelease];
    [[HPWVistor sharedVistor] registerCommpanyCode:@"128212" appkey:@"6868ca56-3740-4ab1-aa41-d827fa617540" environment:HPWEnvironmentTypeRelease];
    [LYTSDKSetting isPrintDebugLog:YES];


    //3、设置主题色
    [self setupNavigationBar];
    return YES;
}
- (void)setupNavigationBar {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage visitor_imageWithColor:color01a] forBarMetrics:UIBarMetricsDefault];
    if( [[UIDevice currentDevice].systemVersion doubleValue]>=8.0f&&[UINavigationBar conformsToProtocol:@protocol(UIAppearanceContainer)]) {
        [[UINavigationBar appearance] setTranslucent:NO];
    }
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           nil, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18], NSFontAttributeName, nil]];
}

@end
