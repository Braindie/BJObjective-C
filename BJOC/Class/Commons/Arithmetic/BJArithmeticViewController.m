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
    
    //降序排序（冒泡算法）
//    [self maopaoAction];
    
    //升序排序
//    [self shenxupaixuAction];
    
    //字符串逆序
    [self stringInverseAction];
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

#pragma mark - 升序排序
- (void)shenxupaixuAction{
    NSMutableArray *array = @[@"24",@"17",@"85",@"13",@"9",@"54",@"76",@"45",@"5",@"63"].mutableCopy;

    NSInteger n = array.count;
    NSInteger index;
    for (NSInteger i = 0; i < n - 1; i++) {
        index = i;
        for (NSInteger j = i + 1; j < n; j++) {
            if ([array[index] integerValue] > [array[j] integerValue]) {
                index = j;//获取当前数后面的最小的数的坐标
            }
        }
//        NSLog(@"-----%d",index);
        if (index != i) {
            NSString *str = array[i];//获取当前数
            array[i] = array[index];//把最小的那个数赋给当前数
            array[index] = str;//把当前数赋给之前最小的数的那个位置
        }
        
//        for (int i = 0; i < n; i++) {
//            NSLog(@"%@",array[i]);
//        }
    }
    
    for (int i = 0; i < n; i++) {
        NSLog(@"%@",array[i]);
    }
}

#pragma mark - 字符串逆序
- (void)stringInverseAction{

}

@end
