//
//  AppDelegate.m
//  YWeiBo
//
//  Created by qingyun on 16/1/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "Common.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //2.根据不同情况制定根视图控制器
    
    self.window.rootViewController = [self instantiateRootViewViewController];
    //显示window，让window活跃起来
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(id)instantiateRootViewViewController
{
   //当前运行的版本
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    
    //本地保存版本
    NSUserDefaults *userDe = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [userDe objectForKey:kAPP_Version];
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if ([currentVersion isEqualToString:localVersion]) {
        //已经运行过改版本
         //初始化主控制器
        UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"main"];
        
        return vc;
        
    }else {
      //第一次运行该版本
     //初始化引导页控制器
        UIViewController *vc = [story instantiateViewControllerWithIdentifier:@"guide"];
        
        //跟新本地存储版本
        [userDe setObject:currentVersion forKey:kAPP_Version];
        [userDe synchronize];

        return vc;
        
    }
    
    
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
