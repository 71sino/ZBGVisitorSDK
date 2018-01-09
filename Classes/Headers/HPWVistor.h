//
//  HPWVistor
//  VistorCode
//
//  Created by 谭建中 on 14/6/15.
//  Copyright © 2015年 谭建中. All rights reserved.
//


#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
//SDK环境信息
typedef NS_ENUM(NSInteger, HPWEnvironmentType) {
    HPWEnvironmentTypePrepareRelease = 1,   // 预发布环境
    HPWEnvironmentTypeRelease = 2,    // 发布环境
};
@protocol HPWVistorDelegate <NSObject>

/**
 SDK收到了新消息
 */
- (void)vistorDidReceiveMessage:(NSString *)content;

/**
 SDK消息的未读数
 */
- (void)vistorUnReadMessageNum:(NSInteger)num;

@end

@interface HPWVistor : NSObject

/**
 SDK的代理
 */
@property (nonatomic,weak) id <HPWVistorDelegate> delegate;

/**
 用于展示访客SDK视图的控制器
 */
@property (nonatomic,weak) UIViewController * mainCon;

#pragma mark - 必要设置
/**
 智八哥SDK单例（请使用单例调用）
 */
+ (instancetype)sharedVistor;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;


/**
 注册应用（必须设置！！！在AppDelegate中设置）
 @param code 公司代号（申请时，分配的公司代号）
 @param appkey 应用标示(在管理后台页面申请)
 */
- (void)registerCommpanyCode:(NSString *)code appkey:( NSString *)appkey environment:(HPWEnvironmentType) envirommentType;

/**
 启动访客SDK的入口
 @param mainCon    用于展示访客SDK视图的控制器
 @param completion 访客SDK视图dismiss完成
 @param fail SDK出现错误
 */
- (void)showView:(UIViewController *)mainCon dismissCompletion:(void (^)())completion errorFail:(void(^)())fail;

#pragma mark - 可选设置
/**
 当前版本
 */
- (NSString *)curentVersion;

/**
 查询未读数
 */
- (void)queryUnreadNumMessageSucceed:(void (^)(NSInteger num))block;

/**
 设置访客的唯一标示到SDK
 */
- (void)setPartnerUid:(NSString *)partnerUid;

/**
 用户轨迹记录
 @param curUrl 当前浏览页面
 @param pageTitle 当前浏览页面标题
 @param resolution 手机分辨率
 @param sourceUrl 浏览器类型
 @param success 提交成功
 @param fail 提交失败
 */
- (void)addTrajectoryInfo:(NSString *)curUrl
                    pageTitle:(NSString *)pageTitle
                   resolution:(NSString *)resolution
                    sourceUrl:(NSString *)sourceUrl
                       result:(void (^)())success fail:(void (^)())fail;
/**
 清除用户轨迹
 */
- (void)clearTrajectoryInfo;

@end
NS_ASSUME_NONNULL_END
