//
//  CALayer+FMPauseAimate.m
//  FMDemo
//
//  Created by zf on 2019/1/17.
//  Copyright © 2019 zf. All rights reserved.
//

#import "CALayer+FMPauseAimate.h"

@implementation CALayer (FMPauseAimate)

// 暂停动画
- (void)pauseAnimate
{
    CFTimeInterval pauseTime = [self convertTime:CACurrentMediaTime() toLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pauseTime;
}
// 恢复动画
- (void)resumeAnimate
{
    CFTimeInterval pauseTime = self.timeOffset;
    self.speed = 1.0;
    self.beginTime = 0;
    self.timeOffset = 0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() toLayer:nil] - pauseTime;
    self.beginTime = timeSincePause;
}

@end
