//
//  BJRealizeViewController.m
//  BJBlock
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJRealizeViewController.h"

static int static_global_i = 2;
int global_i = 3;

@interface BJRealizeViewController ()

@end

@implementation BJRealizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 全局block
    [self testBlock1];

    // 堆block
//    [self testBlock2];

    // 栈block
//    [self testBlock3];

}

- (void)testBlock1{
    
    static int static_k = 1;
    
    //__NSGlobalBlock__持有对象
    //不会访问任何外部变量，或者只用到全局变量、静态变量
    void(^blockA)() = ^{
        NSLog(@"just a block === %d %d %d",static_k,global_i,static_global_i);
    };
    NSLog(@"blockA == %@", blockA);
    
    blockA();

}

- (void)testBlock2{
    //__NSMallocBlock__不持有对象
    //当函数返回时销毁
    int value = 10;
    void(^blockB)() = ^{
        NSLog(@"just a block === %d", value);
    };
    NSLog(@"blockB == %@", blockB);
    blockB();

}

- (void)testBlock3{

    //__NSStackBlock__持有对象
    //当引用计数为0时销毁
    //只用到外部局部变量、成员属性变量，且没有强指针引用的block都是StackBlock
    //强行用__weak声明让其分配在栈上，会有警告
//    int value = 10;
//    void(^ __weak blockC)() = ^{
//        NSLog(@"just a block === %d", value);
//    };
//    NSLog(@"blockC == %@", blockC);
//    blockC();

    
    //这种情况就是ARC环境下Block也是__NSStackBlock的类型。
    __block int temp = 10;
    NSLog(@"%@",^{NSLog(@"******%d %p",temp++,&temp);});
    
}


@end
