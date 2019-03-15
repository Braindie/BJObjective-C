//
//  BJKVCViewController.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJKVCViewController.h"
#import "BJStudent.h"

@interface BJKVCViewController ()

@end

@implementation BJKVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"KVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    BJStudent *student = [[BJStudent alloc] init];
    [student setValue:@(18) forKey:@"age"];

    
    [student setValue:@"张三" forKey:@"myName"];//没有name属性，Crash

    NSString *str = [student valueForKey:@"myName"];
    NSLog(@"%@",str);
    
    
}


@end
