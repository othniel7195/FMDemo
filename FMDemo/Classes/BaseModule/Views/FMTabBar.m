//
//  FMTabbar.m
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import "FMTabBar.h"
#import "FMMidPlayView.h"
#import "UIView+FMLayout.h"
#import "FMDeviceInfo.h"

inline CGSize ScreenSize()
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    return size;
}


@interface FMTabBar ()
@property(nonatomic, weak)FMMidPlayView *middlePlayView;
@end

@implementation FMTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self stepUI];
    return self;
}

- (void)stepUI{
    
    self.barStyle = UIBarStyleBlack;
    
    self.backgroundImage = [[UIImage imageNamed:@"tabbar_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 10, 0) resizingMode:UIImageResizingModeStretch];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger itemCount = self.items.count;
    CGFloat btnW = self.width / (itemCount + 1);
    NSInteger index = 0;
    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            //tabbar button 有4个原生的 中间一个自定义的 原生第三个移动到自定义后面
            if (index == itemCount / 2) {
                index ++;
            }
            CGFloat btnX = index * btnW;
            subView.x = btnX;
            subView.width = btnW;
            subView.y = 5;
            if ([FMDeviceInfo isIphoneX]) {
                subView.height = self.height - 15;
            }else{
                subView.height = self.height - 5;
            }
            
            index ++;
        }
    }
    
    self.middlePlayView.centerX = self.centerX;
    if ([FMDeviceInfo isIphoneX]) {
        self.middlePlayView.y = self.height - self.middlePlayView.height - 33;
    }else{
        self.middlePlayView.y = self.height - self.middlePlayView.height;
    }
    
    self.middlePlayView.fmMidPlayClickBlock = ^(BOOL playing) {
        
    };
}

- (FMMidPlayView *)middlePlayView
{
    if (!_middlePlayView) {
        FMMidPlayView *midPlayView = [FMMidPlayView shareInstance];
        [self addSubview:midPlayView];
        _middlePlayView = midPlayView;
    }
    return _middlePlayView;
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
 
    CGPoint tabbarPoint = [self convertPoint:point toView:self];
    
    if (tabbarPoint.y > 0 ) {
        return YES;
    }
    
    CGPoint middleViewPoint = [self convertPoint:point toView:self.middlePlayView];
    if (middleViewPoint.y > 0) {
        
        return YES;
    }
    
    return NO;
}

@end
