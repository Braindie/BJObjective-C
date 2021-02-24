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
    
    Printer *colorPrint = [[ColorPrinter alloc] init];
    Printer *blackPrint = [[BlackPrinter alloc] init];
    
    //同一个方法作用于不同的类，产生不同的执行效果
    //一般结合继承来使用，通过重写父类方法，来使得对同一类对象的同一方法的调用产生不同的结果
    [person doPrint:colorPrint];
    [person doPrint:blackPrint];
}

@end
