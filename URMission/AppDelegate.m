//
//  AppDelegate.m
//  URMission
//
//  Created by lin weiyan on 2018/7/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "AppDelegate.h"
#import "URMissionScheduleViewController.h"
#import "URNavigateController.h"

@interface AppDelegate ()<UITabBarDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    URMissionScheduleViewController *scheduleController = [[URMissionScheduleViewController alloc] init];
    scheduleController.title = @"计划";
    scheduleController.tabBarItem.title = @"计划";
    URNavigateController *navigationController = [[URNavigateController alloc] initWithRootViewController:scheduleController];
    
    UIViewController *UIViewController1 = [[UIViewController alloc] init];
    UIViewController1.tabBarItem.title = @"任务";
    UIViewController1.title = @"任务";
    URNavigateController *navigationController1 = [[URNavigateController alloc] initWithRootViewController:UIViewController1];

    UIViewController *UIViewController2 = [[UIViewController alloc] init];
    UIViewController2.tabBarItem.title = @"我";
    UIViewController2.title = @"我";
    URNavigateController *navigationController2 = [[URNavigateController alloc] initWithRootViewController:UIViewController2];

    tabbarController.tabBar.tintColor = [UIColor redColor];
    tabbarController.viewControllers = @[navigationController, navigationController1, navigationController2];
    
    self.window.rootViewController = tabbarController;
    //2.设置Window为主窗口并显示出来
    [self.window makeKeyAndVisible];
    return YES;
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


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}

@end
