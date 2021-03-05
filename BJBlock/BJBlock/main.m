//
//  main.m
//  BJBlock
//
//  Created by zhangwenjun on 16/12/26.
//  Copyright © 2016年 zhangwenjun. All rights reserved.
//


#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
//#import "AppDelegate.h"

//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//    }
//}


#pragma mark -
//struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//};
//
//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
//};
//
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    int age;
//};
//
//int main(int argc, char * argv[]) {
//    @autoreleasepool {
//
////        ^{
////            NSLog(@"this is a block");
////        }();
//
//
//        int age = 20;
//        void (^block)(int, int) = ^(int a, int b){
//            NSLog(@"this is a block -- %d", age);
//        };
//        // block结构
//        struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
//
//        block(10, 10);
//
//        return 0;
//    }
//}



#pragma mark - capture
//int global = 1;

//static int static_global = 2;

int main(int argc, char * argv[]) {
    @autoreleasepool {

        auto int local = 3;

        static int static_local = 4;

        void (^block)() = ^{
            
//            local = 30;// 无法捕获
            
            static_local = 40;
            
//            global  = 10;

//            static_global = 20;

            NSLog(@"Block中 local = %d", local);
            NSLog(@"Block中 static_local = %d", static_local);
//            NSLog(@"Block中 global = %d", global);
//            NSLog(@"Block中 static_global = %d", static_global);

        };

//        local = 300;
        
//        static_local = 400;
        
//        global  = 100;

//        static_global = 200;
        
        block();
        
        
        NSLog(@"Block外 local = %d", local);
        NSLog(@"Block外 static_local = %d", static_local);
//        NSLog(@"Block外 global = %d", global);
//        NSLog(@"Block外 static_global = %d", static_global);


        return 0;
    }
}
