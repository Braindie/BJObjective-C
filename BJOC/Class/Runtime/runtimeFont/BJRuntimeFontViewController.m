//
//  BJRuntimeFontViewController.m
//  BJRuntime
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJRuntimeFontViewController.h"

@interface BJRuntimeFontViewController ()

@end

@implementation BJRuntimeFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"本字体根据屏幕宽度自适应大小";
    label.textAlignment = NSTextAlignmentCenter;
    label.bounds = CGRectMake(0, 0, 300, 30);
    label.center = CGPointMake(self.view.center.x, 100);
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:16];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
