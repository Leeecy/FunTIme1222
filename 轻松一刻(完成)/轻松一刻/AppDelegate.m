//
//  AppDelegate.m
//  轻松一刻
//
//  Created by chenl on 16/3/18.
//  Copyright © 2016年 chenl. All rights reserved.
//

#import "AppDelegate.h"
#import "CLTabBarController.h"
//引导页
#import "CLPushGuideView.h"
//点击顶部回到最上面
#import "CLTopWindow.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UMSocialData setAppKey:@"57231a26e0f55a59a90008ef"];
    //设置微信AppID  wxdc1162e651667d18
    [UMSocialWechatHandler setWXAppId:@"wxdc1162e651667d18" appSecret:@"845e3bda54f429a9a1d90543d1cbbd73" url:@"https://github.com/chenl326"];
    
    //qq的AppID
    [UMSocialQQHandler setQQWithAppId:@"1105419274" appKey:@"1OgBGy8isTfSDIzz" url:@"https://github.com/chenl326"];
    
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToWechatSession, UMShareToWechatTimeline]];
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    // 设置窗口的根控制器
    self.window.rootViewController = [[CLTabBarController alloc]init];
    // 显示窗口
    [self.window makeKeyAndVisible];
    
    // 显示推送引导
    [CLPushGuideView show];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // 添加一个window, 点击这个window, 可以让屏幕上的scrollView滚到最顶部
    [CLTopWindow show];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
