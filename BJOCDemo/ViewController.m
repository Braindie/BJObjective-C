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

#import "Whale.h"

@interface ViewController ()
    
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];


    [self polymorphism];
    
    
    [self designatedInitializer];
    
    
}
- (void)designatedInitializer{
    Whale *whale1 = [[Whale alloc] initWhale];                 // 1
    NSLog(@"whale1 %@", whale1);
    
    Whale *whale2 = [[Whale alloc] initWithName:@"Whale"];     // 2
    NSLog(@"whale2 %@", whale2);

    Whale *whale3 = [[Whale alloc] init];                      // 3
    NSLog(@"whale3 %@", whale3);

    Whale *whale4 = [[Whale alloc] initWithLegs:4];            // 4
    NSLog(@"whale4 %@", whale4);

    Whale *whale5 = [[Whale alloc] initWithName:@"Whale" andLegs:8];    // 5
    NSLog(@"whale5 %@", whale5);
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


@end
