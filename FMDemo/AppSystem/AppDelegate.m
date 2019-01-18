//
//  AppDelegate.m
//  FMDemo
//
//  Created by zf on 2019/1/15.
//  Copyright © 2019 zf. All rights reserved.
//

#import "AppDelegate.h"
#import "FMTabBarController.h"
#import "Test1.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    FMTabBarController *tabbarVC = [FMTabBarController tabbarAddChildVCs:^(FMTabBarController * _Nonnull tabbarVC) {
        
        [tabbarVC addChildViewController:[Test1 new] title:nil normalImageName:@"tabbar_find_h" selectedImageName:@"tabbar_find_h" isRequiredNavController:YES];
         [tabbarVC addChildViewController:[Test1 new] title:nil normalImageName:@"tabbar_sound_n" selectedImageName:@"tabbar_sound_h" isRequiredNavController:YES];
         [tabbarVC addChildViewController:[Test1 new] title:nil normalImageName:@"tabbar_download_h" selectedImageName:@"tabbar_download_h" isRequiredNavController:YES];
         [tabbarVC addChildViewController:[Test1 new] title:nil normalImageName:@"tabbar_me_n" selectedImageName:@"tabbar_me_h" isRequiredNavController:YES];
    }];
    
    self.window.rootViewController = tabbarVC;
    [self.window makeKeyAndVisible];
    
    tabbarVC.selectedIndex = 0;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


@end
