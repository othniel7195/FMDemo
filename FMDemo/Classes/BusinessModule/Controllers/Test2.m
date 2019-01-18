//
//  Test2.m
//  FMDemo
//
//  Created by zhao.feng on 2019/1/18.
//  Copyright © 2019年 zf. All rights reserved.
//

#import "Test2.h"

@interface Test2 ()

@end

@implementation Test2

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 100, 20)];
    label.text = @"TEST2";
    [self.view addSubview:label];
}



@end
