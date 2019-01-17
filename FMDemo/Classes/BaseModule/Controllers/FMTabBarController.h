//
//  FMTabBarController.h
//  FMDemo
//
//  Created by zf on 2019/1/18.
//  Copyright © 2019 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMTabBarController : UITabBarController

+ (instancetype)shareInstance;

- (void)addChildViewController:(UIViewController *)childController normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;
@end

NS_ASSUME_NONNULL_END
