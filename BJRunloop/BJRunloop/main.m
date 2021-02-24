//
//  main.m
//  BJThread
//
//  Created by zhangwenjun on 17/3/3.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//    }
//}


int main(int argc, char * argv[]) {
    @autoreleasepool {
        int res = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        NSLog(@"------");
        //不会打印，因为程序一直在运行着，UIApplicationMain这个函数的内部启动了一个Runloop，所以函数一直没有返回，才使得程序保持运行。
        return res;
    }
}
