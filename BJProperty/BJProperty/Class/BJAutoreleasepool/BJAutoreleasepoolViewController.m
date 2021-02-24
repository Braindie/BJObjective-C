//
//  BJAutoreleasepoolViewController.m
//  BJProperty
//
//  Created by zhangwenjun on 2019/11/20.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJAutoreleasepoolViewController.h"

@interface BJAutoreleasepoolViewController ()

@end

@implementation BJAutoreleasepoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self useAutoPool];
}

- (void)useAutoPool{
    
    // 在循环中创建大量的临时变量，在方法没走完的时候是不会释放的，内存会不断增加
    for (NSInteger i = 0; i < 1000000; i++) {
        // 如果加上自动释放池，每次循环结束的时候释放池子，内存不会一直增加了
        @autoreleasepool {
            NSString *str = @"hello";
            str = [str stringByAppendingFormat:@" - %ld", i];
            NSLog(@"%@", str);
        }
    }
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
