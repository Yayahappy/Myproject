//
//  AppDelegate.m
//  tarbarcontroller2
//
//  Created by qingyun on 15/11/26.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.hidden = NO;
    _window = window;
    
    //创建window的根视图控制器
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    //设置代理
    tabbarController.delegate = self;
    
    //设置ViewControllers
    
    FirstViewController *firatVC = [[FirstViewController alloc] init];
    
    //创建FirstViewController的根视图控制器
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firatVC];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    UIImage *image = [[UIImage imageNamed:@"tab_heros_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectedImage = [[UIImage imageNamed:@"tab_heros_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    firatVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"hero" image:image selectedImage:selectedImage];
    NSArray *vcs = @[firstNav,secondVC];
    
    tabbarController.viewControllers = vcs;
    
    _window.rootViewController = tabbarController;
    
    //设置tabbar整体的颜色
 // tabbarController.tabBar.barTintColor = [UIColor orangeColor];
    
    //
    tabbarController.tabBar.tintColor = [UIColor blueColor];
    
    //设置背景
    UIImage *image1 = [[UIImage imageNamed:@"bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(7, 7, 7, 7) resizingMode:UIImageResizingModeTile];
    
    [tabbarController.tabBar setBackgroundImage:image1];
    
    //设置透明属性
    tabbarController.tabBar.translucent = NO;
    
    return YES;
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    viewController.tabBarItem.badgeValue = nil;
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
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
