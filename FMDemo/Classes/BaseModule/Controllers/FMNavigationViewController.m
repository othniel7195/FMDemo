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
#import "UIView+FMLayout.h"
#import "FMDeviceInfo.h"


@interface FMNavigationViewController ()<UIGestureRecognizerDelegate>

@end

static inline CGSize ScreenSize()
{
    return [UIScreen mainScreen].bounds.size;
}

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
    if (self.viewControllers.count > 1) {
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_n"] style:UIBarButtonItemStylePlain target:self action:@selector(popBack)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    if ([viewController isMemberOfClass:[FMBaseViewController class]]) {
        FMBaseViewController *baseVC = (FMBaseViewController *)viewController;
        if ([baseVC needMiddlePlayView]) {
            FMMidPlayView *middlePlayView = [FMMidPlayView shareInstance];
            middlePlayView.centerX = (ScreenSize().width - middlePlayView.width) * 0.5;
            if ([FMDeviceInfo isIphoneX]) {
                middlePlayView.y = ScreenSize().height - middlePlayView.height - 10;
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
