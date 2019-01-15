//
//  FMTabbar.h
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface FMTabBar : UITabBar

@property(nonatomic, copy)void(^tabbarMidClickBlock)(BOOL playing);

@end

NS_ASSUME_NONNULL_END
