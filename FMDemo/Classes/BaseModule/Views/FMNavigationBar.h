//
//  FMNavigationBar.h
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMNavigationBar : UINavigationBar


//设置导航背景图
- (void)setNavigationBarBackgroundImage:(UIImage *)image;

- (void)setNavigationTextColor:(UIColor *)color fontSize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
