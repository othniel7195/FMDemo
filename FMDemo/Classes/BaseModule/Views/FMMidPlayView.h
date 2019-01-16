//
//  FMMidPayView.h
//  FMDemo
//
//  Created by zf on 2019/1/16.
//  Copyright © 2019 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMMidPlayView : UIView

+ (instancetype)shareInstance;

@property(nonatomic, strong)UIImage *middleImg;
@property(nonatomic, assign)BOOL isPlaying;

@property(nonatomic, copy)void(^fmMidPlayClickBlock)(BOOL playing);

@end

NS_ASSUME_NONNULL_END
