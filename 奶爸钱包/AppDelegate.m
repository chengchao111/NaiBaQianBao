//
//  AppDelegate.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "BasicTabBarViewController.h"
#import "BasicNavgationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"我修改了");
    // Override point for customization after application launch.
    [self NavgationSet];
    LoginViewController *vc = [[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    return YES;
}
//设置导航和TabBar
- (void)NavgationSet{

    //去除导航栏下边的线
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    //返回按钮的颜色
    [[UINavigationBar appearance]setTintColor:[UIColor blackColor]];
    //设置导航栏的背景色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];

    
    //设置导航栏标题颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:SCREENH(20)]}];
    //修改tabBar的字体颜色,选中
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR(243, 105, 106),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//
//    //修改tabBar的字体颜色,未选中
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR(183, 183, 183),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
