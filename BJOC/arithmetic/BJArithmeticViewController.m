//
//  BJArithmeticViewController.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/1.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJArithmeticViewController.h"

@interface BJArithmeticViewController ()

@end

@implementation BJArithmeticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self maopaoAction];
}


#pragma mark - 冒泡排序(由大到小）
//很容易导致数组越界，后台返回的数据尽量少做处理，因为解析数据时会产生不必要的bug
- (void)maopaoAction{
    
    NSArray *array = @[@"24",@"17",@"85",@"13",@"9",@"54",@"76",@"45",@"5",@"63"];
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    
    NSInteger num = [array count];
    for (int  i = 0; i < num-1; i++) {
        for (int j = 0; j < num - 1 - i; j++) {
            if ([mutableArray[j] integerValue] < [mutableArray[j+1] integerValue]) {
                NSString *tmpStr = mutableArray[j];
                mutableArray[j] = mutableArray[j+1];
                mutableArray[j+1] = tmpStr;
            }
        }
    }
    
    for (int i = 0; i < num; i++) {
        NSLog(@"%@",mutableArray[i]);
    }
}

@end
