//
//  Test1.m
//  FMDemo
//
//  Created by zf on 2019/1/18.
//  Copyright © 2019 zf. All rights reserved.
//

#import "Test1.h"
#import "Test2.h"


@interface Test1 ()

@end

@implementation Test1

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 180, 100, 20)];
    label.text = @"TEST1";
    [self.view addSubview:label];
    
    self.view.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    static BOOL isPlaying = NO;
    
    isPlaying = !isPlaying;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(isPlaying)];
    
    [self.navigationController pushViewController:[Test2 new] animated:YES];
}

@end
