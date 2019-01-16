//
//  CALayer+FMPauseAimate.h
//  FMDemo
//
//  Created by zf on 2019/1/17.
//  Copyright © 2019 zf. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (FMPauseAimate)

// 暂停动画
- (void)pauseAnimate;

// 恢复动画
- (void)resumeAnimate;
@end

NS_ASSUME_NONNULL_END
