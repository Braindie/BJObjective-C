//
//  BJPolymorphismViewController.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/1.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJPolymorphismViewController.h"

#import "Person.h"
#import "ColorPrinter.h"
#import "BlackPrinter.h"

@interface BJPolymorphismViewController ()

@end

@implementation BJPolymorphismViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    
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

@end
