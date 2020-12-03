//
//  BJRuntimeButtonViewController.m
//  BJRuntime
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJRuntimeButtonViewController.h"
#import "UIControl+BJRuntimeControl.h"

@interface BJRuntimeButtonViewController ()

@end

@implementation BJRuntimeButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 100, 30);
    button.center = CGPointMake(self.view.center.x, 200);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button.bj_acceptEventInterval = 5;
    
}

- (void)buttonAction:(UIButton *)sender{
    NSLog(@"点击了一次");
}

@end
