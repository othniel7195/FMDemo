//
//  FMNavigationViewController.h
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMNavigationViewController : UINavigationController

@end

static inline CGSize ScreenSize()
{
    return [UIScreen mainScreen].bounds.size;
}


NS_ASSUME_NONNULL_END
