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

+ (instancetype)tabbarAddChildVCs:(void(^)(FMTabBarController* tabbarVC))block;

- (void)addChildViewController:(UIViewController *)childController
                         title:(nullable NSString *)title
               normalImageName: (NSString *)normalImageName
             selectedImageName:(NSString *)selectedImageName
       isRequiredNavController: (BOOL)isRequired;
@end

NS_ASSUME_NONNULL_END
