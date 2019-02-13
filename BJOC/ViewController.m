//
//  ViewController.m
//  TempDemo
//
//  Created by zhangwenjun on 16/6/2.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"
#import "ColorPrinter.h"
#import "BlackPrinter.h"


@interface ViewController ()
    
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];


    [self polymorphism];
    
}

#pragma mark - 多态
- (void)polymorphism{
    
    Person *person = [[Person alloc] init];
    
    ColorPrinter *colorPrint = [[ColorPrinter alloc] init];
    BlackPrinter *blackPrint = [[BlackPrinter alloc] init];
    
    BOOL isColorPrinter = NO;
    if (isColorPrinter) {
        [person doPrint:colorPrint];
    }else{
        [person doPrint:blackPrint];
    }
}


#pragma mark - 冒泡排序(由大到小）
//很容易导致数组越界，后台返回的数据尽量少做处理，因为解析数据时会产生不必要的bug
- (void)bobSortMethod{
    
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
