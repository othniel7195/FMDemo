//
//  FMMidPayView.m
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import "FMMidPlayView.h"
#import "CALayer+FMPauseAimate.h"
#import "UIButton+FMButton.h"

@interface FMMidPlayView ()
@property(nonatomic, strong)UIImageView *middlePlayImageVew;
@property(nonatomic, strong)UIButton *playBtn;
@end

@implementation FMMidPlayView

+ (instancetype)shareInstance
{
    static FMMidPlayView *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [FMMidPlayView middleView];
    });
    
    return instance;
}

+ (instancetype)middleView
{
    FMMidPlayView *midView = [[FMMidPlayView alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
    return midView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self stepUI];
    return self;
    
}

- (void)stepUI{
    
    UIImageView *tabbar_np_shadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_shadow"]];
    tabbar_np_shadow.frame = self.bounds;
    [self addSubview:tabbar_np_shadow];
    
    UIImageView *tabbar_np_normal = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_normal"]];
    tabbar_np_normal.frame = self.bounds;
    [self addSubview:tabbar_np_normal];
    
    UIImageView *tabbar_np_playshadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_np_playshadow"]];
    tabbar_np_playshadow.frame = self.bounds;
    [self addSubview:tabbar_np_playshadow];
    
    UIImageView *zxy_icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zxy_icon"]];
    zxy_icon.frame = CGRectMake(11, 11, 43, 43);
    [self addSubview:zxy_icon];
    self.middlePlayImageVew = zxy_icon;
    
    UIButton *tabbar_np_play = [UIButton buttonWithType:UIButtonTypeCustom];
    [tabbar_np_play setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
    tabbar_np_play.frame = CGRectMake(10, 10, 45, 45);
    [self addSubview:tabbar_np_play];
    self.playBtn = tabbar_np_play;
    
    
    self.middleImg = self.middlePlayImageVew.image;

    self.middlePlayImageVew.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner|kCALayerMinXMaxYCorner|kCALayerMaxXMaxYCorner;
    [self playAnimation];
    
    [self.playBtn addTarget:self action:@selector(middleClick) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isToPlay:) name:@"playState" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:@"playImage" object:nil];
    
}

- (void)middleClick
{
    self.isPlaying = !self.isPlaying;
    if (self.fmMidPlayClickBlock) {
        self.fmMidPlayClickBlock(self.isPlaying);
    }
}

- (void)isToPlay:(NSNotification *)notification
{
    self.isPlaying = [notification.object boolValue];
}

- (void)setIsPlaying:(BOOL)isPlaying
{
    if (_isPlaying == isPlaying) return;
    
    _isPlaying = isPlaying;
    
    if (isPlaying) {
        [self.playBtn setImage:nil forState:UIControlStateNormal];
        [self.middlePlayImageVew.layer resumeAnimate];
    }else{
        [self.playBtn setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
        [self.middlePlayImageVew.layer pauseAnimate];
    }
}

- (void)setPlayImage:(NSNotification *)notification
{
    self.middleImg = (UIImage *)notification.object;
}
- (void)setMiddleImg:(UIImage *)middleImg
{
    _middleImg = middleImg;
    self.middlePlayImageVew.image = middleImg;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.middlePlayImageVew.layer.cornerRadius = CGRectGetMidX(self.middlePlayImageVew.frame);
}

- (void)playAnimation
{
    [self.middlePlayImageVew.layer removeAnimationForKey:@"playAnimation"];
    CABasicAnimation *playAnimate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    playAnimate.fromValue = @(0);
    playAnimate.toValue = @(M_PI * 2);
    playAnimate.duration = 30.f;
    playAnimate.repeatCount = MAXFLOAT;
    playAnimate.removedOnCompletion = NO;
    [self.middlePlayImageVew.layer addAnimation:playAnimate forKey:@"playAnimation"];
    [self.middlePlayImageVew.layer pauseAnimate];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
