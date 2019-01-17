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
    
    
    return self;
}

- (void)stepUI{
    
    self.barStyle = UIBarStyleBlack;
    
    self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    self.middlePlayView.centerX = self.centerX;
    
    if ([FMDeviceInfo isIphoneX]) {
        self.middlePlayView.y = ScreenSize().height - self.middlePlayView.height - 10;
    }else{
        self.middlePlayView.y = ScreenSize().height - self.middlePlayView.height;
    }
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
        }
    }
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

@end
