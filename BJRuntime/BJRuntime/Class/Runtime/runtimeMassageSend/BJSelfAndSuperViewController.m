//
//  BJSelfAndSuperViewController.m
//  BJRuntime
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJSelfAndSuperViewController.h"
//#import "Son.h"

@interface BJSelfAndSuperViewController ()

@end

@implementation BJSelfAndSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    
//    /**
//     *   self与supper
//     */
//    Son *son = [[Son alloc] init];
//    NSLog(@"%@",[son personGetString]);
//
//    /**
//     *   向nil发送消息
//     */
//    BJPerson *person = nil;
//    NSLog(@"%@",[person personGetString]);

}


/**
 *   测试消息转发（其他地方要使用）
 */
- (void)foo{
    NSLog(@"dynamic add new method in runtime");
}


@end
