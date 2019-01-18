//
//  FMTabBarController.m
//  FMDemo
//
//  Created by zf on 2019/1/18.
//  Copyright © 2019 zf. All rights reserved.
//

#import "FMTabBarController.h"
#import "FMTabBar.h"
#import "UIImage+FMImage.h"
#import "FMNavigationViewController.h"
#import "FMBaseViewController.h"
#import "FMMidPlayView.h"
#import "FMDeviceInfo.h"
#import "UIView+FMLayout.h"

@interface FMTabBarController ()<UITabBarControllerDelegate>

@end

@implementation FMTabBarController

+ (instancetype)shareInstance
{
    static FMTabBarController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FMTabBarController alloc] init];
    });
    return instance;
}

+ (instancetype)tabbarAddChildVCs:(void(^)(FMTabBarController* tabbarVC))block
{
    FMTabBarController *tabbarVC = [FMTabBarController shareInstance];
    tabbarVC.delegate = tabbarVC;
    if (block) {
        block(tabbarVC);
    }
    
    return tabbarVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self stepUI];
    
}

- (void)stepUI{
    [self setValue:[[FMTabBar alloc] init] forKey:@"tabBar"];
}

- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString *)title
               normalImageName: (NSString *)normalImageName
             selectedImageName:(NSString *)selectedImageName
       isRequiredNavController: (BOOL)isRequired
{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
    if (isRequired) {
        
        FMNavigationViewController *nav = [[FMNavigationViewController alloc] initWithRootViewController:childController];
        nav.tabBarItem = item;
        
        [self addChildViewController:nav];
    }else{
        childController.tabBarItem = item;
        [self addChildViewController:childController];
    }
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    UIViewController *viewController =  self.childViewControllers[selectedIndex];
    if ([viewController isMemberOfClass:[FMBaseViewController class]]) {
        FMBaseViewController *baseVC = (FMBaseViewController *)viewController;
        if ([baseVC needMiddlePlayView]) {
            FMMidPlayView *middlePlayView = [FMMidPlayView shareInstance];
            middlePlayView.centerX = (ScreenSize().width - middlePlayView.width) * 0.5;
            if ([FMDeviceInfo isIphoneX]) {
                middlePlayView.y = ScreenSize().height - middlePlayView.height - 33;
            }else{
                middlePlayView.y = ScreenSize().height - middlePlayView.height;
            }
            
            [viewController.view addSubview:middlePlayView];
        }
    }
}

@end
