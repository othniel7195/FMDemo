//
//  FMNavigationViewController.m
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import "FMNavigationViewController.h"
#import "FMNavigationBar.h"
#import "FMBaseViewController.h"
#import "FMMidPlayView.h"
#import <objc/runtime.h>
#import "UIView+ZFLayout.h"
#import "ZFDeviceInfo.h"
#import "UIImage+ZFImage.h"


@interface FMNavigationViewController ()<UIGestureRecognizerDelegate>

@end


@implementation FMNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    object_setClass(self.interactivePopGestureRecognizer, [UIPanGestureRecognizer class]);
    self.interactivePopGestureRecognizer.delegate = self;
    //不触发touch事件 触发手势事件
    self.interactivePopGestureRecognizer.delaysTouchesBegan = YES;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (!self) return nil;
    
    [self setValue:[FMNavigationBar new] forKey:@"navigationBar"];
    
    return self;
}

- (void)popBack{
    [self popViewControllerAnimated:YES];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage originImageWithName:@"btn_back_n"] style:UIBarButtonItemStylePlain target:self action:@selector(popBack)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    if ([viewController isKindOfClass:[FMBaseViewController class]]) {
        FMBaseViewController *baseVC = (FMBaseViewController *)viewController;
        if ([baseVC needMiddlePlayView]) {
            //不能用单例的视图 ，单例的已经加载到其他视图上了
            FMMidPlayView *middlePlayView = [FMMidPlayView middleView];
            middlePlayView.centerX = viewController.view.centerX;
            if ([ZFDeviceInfo isIphoneX]) {
                middlePlayView.y = ScreenSize().height - middlePlayView.height - 15;
            }else{
                middlePlayView.y = ScreenSize().height - middlePlayView.height;
            }
            
            [viewController.view addSubview:middlePlayView];
        }
    }
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count <= 1) {
            return NO;
        }
    }
    
    return YES;
}


@end
