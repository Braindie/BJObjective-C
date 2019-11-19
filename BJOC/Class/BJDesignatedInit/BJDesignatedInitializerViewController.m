//
//  BJDesignatedInitializerViewController.m
//  BJProperty
//
//  Created by zhangwenjun on 2019/2/13.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJDesignatedInitializerViewController.h"
#import "Animal.h"

@interface BJDesignatedInitializerViewController ()

@end

@implementation BJDesignatedInitializerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    
    /*
    OC的子类初始化函数三规范：
    1. 子类如果有指定初始化函数，那么指定初始化函数实现时必须调用它的直接父类的指定初始化函数。
    2. 子类如果有指定初始化函数，那么便利初始化函数必须调用自己的其它初始化函数(包括指定初始化函数以及其他的便利初始化函数)，不能调用super的初始化函数。
    3. 子类如果有指定初始化函数，那么一定要实现所有父类的指定初始化函数。
    */
    
    
    //使用Whale的指定初始化函数
    Whale *whale1 = [[Whale alloc] initWhale];                 // 1
    NSLog(@"whale1 %@", whale1);
    /*
    -[Whale initWhale]
    -[Mammal initWithName:andLegs:]
    -[Animal initWithName:]
    */
    
    //使用Whale爷爷类Animal的指定初始化函数
    Whale *whale2 = [[Whale alloc] initWithName:@"Whale"];     // 2
    NSLog(@"whale2 %@", whale2);
    /*
    -[Mammal initWithName:]
    -[Whale initWithName:andLegs:]
    -[Whale initWhale]
    -[Mammal initWithName:andLegs:]
    -[Animal initWithName:]
    */
    
    //使用Whale祖宗类NSObject的指定初始化函数
    Whale *whale3 = [[Whale alloc] init];                      // 3
    NSLog(@"whale3 %@", whale3);
    /*
    -[Animal init]
    -[Mammal initWithName:]
    -[Whale initWithName:andLegs:]
    -[Whale initWhale]
    -[Mammal initWithName:andLegs:]
    -[Animal initWithName:]
    */
    
    //使用Whale的父类Mammal的便利初始化函数（对已经初始化好的变量重新赋值，导致变量改变）
    Whale *whale4 = [[Whale alloc] initWithLegs:4];            // 4
    NSLog(@"whale4 %@", whale4);
    /*
    -[Mammal initWithLegs:]
    -[Mammal initWithName:]
    -[Whale initWithName:andLegs:]
    -[Whale initWhale]
    -[Mammal initWithName:andLegs:]
    -[Animal initWithName:]
    */
    
    //使用Whale的父类Mammal的指定初始化函数创建实例
    Whale *whale5 = [[Whale alloc] initWithName:@"Whale" andLegs:4];    // 5
    NSLog(@"whale5 %@", whale5);
    /*
    -[Whale initWithName:andLegs:]
    -[Whale initWhale]
    -[Mammal initWithName:andLegs:]
    -[Animal initWithName:]
    */
    
//总结：指定初始化函数规则只能用来保证对象的创建过程是从跟类到子类依次初始化所有成员变量，无法解决业务问题。
//当我们为自己创建的类添加指定初始化函数时，必须准确的识别并覆盖直接父类所有的指定初始化函数，这样才能保证整个子类的初始化过程可以覆盖到所有继承链上的成员变量得到合适的初始化。
//便利初始化函数只能调用自己类中的其他初始化方法；指定初始化函数才有资格调用父类的指定初始化函数

}



@end
