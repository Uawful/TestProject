//
//  AppDelegate.m
//  bblock
//
//  Created by 唐余威 on 2017/6/20.
//  Copyright © 2017年 yyz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <UMSocialCore/UMSocialCore.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //程序载入后执行，应用程序启动入口
    /**
     * 字典参数launchOptions记录程序启动的原因：
     若由用户直接启动，launchOptions内无数据；
     若由其他应用程序通过openURL启动，则UIApplicationLaunchOptionsURLKey对应的对象为启动URL。UIApplicationLaunchOptionsSourceApplicationKey对应启动的源应用程序的 bundle ID (NSString)；
     若由本地通知启动，则UIApplicationLaunchOptionsLocalNotificationKey对应的是为启动应用程序的的本地通知对象(UILocalNotification)；
     若由远程通知启动，则UIApplicationLaunchOptionsRemoteNotificationKey对应的是启动应用程序远程通知的userInfo（NSDictionary）；
     其他key还有UIApplicationLaunchOptionsAnnotationKey,UIApplicationLaunchOptionsLocationKey,UIApplicationLaunchOptionsNewsstandDownloadsKey
     */
    
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"dddd"];
    
//    [self configUSharePlatforms];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxdc1e388c3822c80b" appSecret:@"3baf1193c85774b3fd9d18447d76cab0" redirectURL:nil];
//    
//    [self confitUShareSettings];
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}



- (void)applicationWillResignActive:(UIApplication *)application {
//    应用程序将要进入非活动状态，即将进入后台
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
//    NSLog(@"如果应用程序支持后台运行，则应用程序已经进入后台运行");

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
//    说明：当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置UIApplicationExitsOnSuspend的键值。、

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)applicationSignificantTimeChange:(UIApplication *)application {
    //当系统时间改变时执行
}
-  (void)application:(UIApplication*)application  willChangeStatusBarFrame:(CGRect)newStatusBarFrame
{
    NSLog(@"StatusBar框将要变化");
}
//- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url
//{
//    return YES;
//}
//说明：当通过url执行

-  (void)application:(UIApplication*)application  didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation
{
}
//说明：当StatusBar框方向变化完成后执行

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //运行状态调用
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    //程序处于后台或杀死状态下，收到远程通知后，当你进入程序时候调用
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
//    当一个应用程序成功的注册一个推送服务（APS）调用
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
}


@end
