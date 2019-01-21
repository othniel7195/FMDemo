//
//  Test2.m
//  FMDemo
//
//  Created by zhao.feng on 2019/1/18.
//  Copyright © 2019年 zf. All rights reserved.
//

#import "Test2.h"
#import "ZFUISegmentBar.h"

@interface Test2 ()

@end

@implementation Test2

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 20)];
    label.text = @"TEST2";
    [self.view addSubview:label];
    
    ZFUISegmentBar *segmentBar = [ZFUISegmentBar segmentBarWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, 30) items:@[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个",@"第六个",@"第七个",@"第八个",@"第九个"]];
    [self.view addSubview:segmentBar];
}

- (BOOL)needMiddlePlayView
{
    return YES;
}

- (void)dealloc
{
    NSLog(@"test2 dealloc");
}
@end
