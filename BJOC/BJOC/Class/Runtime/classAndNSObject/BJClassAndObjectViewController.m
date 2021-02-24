//
//  BJClassAndObjectViewController.m
//  BJRuntime
//
//  Created by zhangwenjun on 2019/4/4.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJClassAndObjectViewController.h"
#import "BJObject.h"

@interface BJClassAndObjectViewController ()

@end

@implementation BJClassAndObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //根据对象的内存分布图来解题
  
    /*
    1.isKindOfClass用来判断某个对象是否属于某个类，或者是属于某个派生类。
    2.isMemberOfClass用来判断某个对象是否为当前类的实例。
    PS:isMemberOfClass不能检测任何的类都是基于NSObject类这一事实，而isKindOfClass可以。
    */
    
    // 判断NSObject 和 NSObject的meta class是否相等,NSObject的meta class与本身不等。接着第二次循环判断NSObject与meta class的superclass是否相等。还是从那张图上面我们可以看到：Root class(meta) 的superclass 就是 Root class(class)，也就是NSObject本身。所以第二次循环相等，于是第一行res1输出应该为YES。
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];


    /* 第一次for循环，BJObject的Meta Class与[BJObject class]不等，
     第二次for循环，BJObject Meta Class的super class 指向的是 NSObject Meta Class， 和 BJObject Class不相等。
     第三次for循环，NSObject Meta Class的super class指向的是NSObject Class，和 BJObject Class 不相等。
     第四次循环，NSObject Class 的super class 指向 nil， 和 BJObject Class不相等。
     第四次循环之后，退出循环，所以第三行的res3输出为NO。
     */
    BOOL res3 = [(id)[BJObject class] isKindOfClass:[BJObject class]];

    // 返回的是类对象
    id objc = (id)[BJObject class];
    // 返回的是实例对象，就相等了
    BJObject *bj = [[BJObject alloc] init];
    BOOL res5 = [bj isMemberOfClass:[BJObject class]];
    BOOL res6 = [bj isKindOfClass:[NSObject class]];



}



@end
