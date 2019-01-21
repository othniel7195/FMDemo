//
//  ZFPlayButton.m
//  FMDemo
//
//  Created by zf on 2019/1/21.
//  Copyright © 2019 zf. All rights reserved.
//

#import "ZFPlayButton.h"

@implementation ZFPlayButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint pointMiddle = [self convertPoint:point toView:self.superview];
    
    CGPoint middleCenter = CGPointMake(32.5,32.5);
    
    CGFloat x2x = powf(fabs(pointMiddle.x - middleCenter.x),2);
    CGFloat y2y = powf(fabs(pointMiddle.y - middleCenter.y), 2);
    
    CGFloat distance = sqrt(x2x + y2y);
    
    if (distance > 33) {
        return NO;
    }
    
    return YES;
}

@end
