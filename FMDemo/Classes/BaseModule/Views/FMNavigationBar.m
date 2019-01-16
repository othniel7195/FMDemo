//
//  FMNavigationBar.m
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import "FMNavigationBar.h"

@implementation FMNavigationBar

- (void)setNavigationBarBackgroundImage:(UIImage *)image
{
    Class cls = NSClassFromString(@"FMNavigationViewController");
    UINavigationBar *navbar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[cls]];
    [navbar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)setNavigationTextColor:(UIColor *)color fontSize:(CGFloat)size
{
    if (!color) return;
    
    CGFloat fontSize = size;
    if (size < 6 || size >40) {
        fontSize = 16;
    }
    
    Class cls = NSClassFromString(@"FMNavigationViewController");
    UINavigationBar *navbar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[cls]];
    [navbar setTitleTextAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
}

@end
