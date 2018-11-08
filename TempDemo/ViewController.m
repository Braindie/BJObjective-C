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
@property (nonatomic, strong)NSMutableArray *linkManArray;
@end

@implementation ViewController
- (NSMutableArray *)linkManArray{
    if (_linkManArray == nil) {
        _linkManArray = [[NSMutableArray alloc] init];
    }
    return _linkManArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

#pragma mark - 多态
    
    Person *person = [[Person alloc] init];
    
    ColorPrinter *colorPrint = [[ColorPrinter alloc] init];
    BlackPrinter *blackPrint = [[BlackPrinter alloc] init];
    
    BOOL isColorPrinter;
    if (isColorPrinter) {
        [person doPrint:colorPrint];
    }else{
        [person doPrint:blackPrint];
    }
    
}


@end
