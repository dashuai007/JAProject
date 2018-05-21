//
//  AppDelegate.m
//  JAProject
//
//  Created by xiazhongchong on 23/03/2018.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "AppDelegate.h"
#import "JATabBarViewController.h"
#import "JABaseNavigationViewController.h"
#import "MobManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    JATabBarViewController *tab = [[JATabBarViewController alloc] init];
    JABaseNavigationViewController *nav = [[JABaseNavigationViewController alloc] initWithRootViewController:tab];
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    [MobManager registerActivePlatforms];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    // 接受传过来的参数
    NSLog(@"打开JAProject了！ well job");
    
    return YES;
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
