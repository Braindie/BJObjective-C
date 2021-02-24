//
//  BJCFRunLoopRefViewController.m
//  BJRunloop
//
//  Created by zhangwenjun on 2019/3/25.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJCFRunLoopRefViewController.h"

@interface BJCFRunLoopRefViewController ()

@end

@implementation BJCFRunLoopRefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self creatObserver];
}

- (void)creatObserver{
    /**
     *   1:即将进入Runloop；2即将处理NSTimer；4：即将处理Sources；32：即将进入休眠；64：刚从休眠中唤醒
     */
    
//    {
//        kCFRunLoopEntry = (1UL << 0),
//        kCFRunLoopBeforeTimers = (1UL << 1),
//        kCFRunLoopBeforeSources = (1UL << 2),
//        kCFRunLoopBeforeWaiting = (1UL << 5),
//        kCFRunLoopAfterWaiting = (1UL << 6),
//        kCFRunLoopExit = (1UL << 7),
//        kCFRunLoopAllActivities = 0x0FFFFFFFU
//    }
    
    
    //创建监听者
    /*
     第一个参数 CFAllocatorRef allocator：分配存储空间 CFAllocatorGetDefault()默认分配
     第二个参数 CFOptionFlags activities：要监听的状态 kCFRunLoopAllActivities 监听所有状态
     第三个参数 Boolean repeats：YES:持续监听 NO:不持续
     第四个参数 CFIndex order：优先级，一般填0即可
     第五个参数 ：回调 两个参数observer:监听者 activity:监听的事件
     */

    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"Runloop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"Runloop要处理Timers了");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"Runloop要处理Sources了");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"Runloop进入休眠了");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"Runloop醒来了");
                break;
            case kCFRunLoopExit:
                NSLog(@"Runloop退出了");
                break;
                
            default:
                break;
        }
        NSLog(@"---%zd",activity);
    });
    
    // 给RunLoop添加监听者
    /*
     第一个参数 CFRunLoopRef rl：要监听哪个RunLoop,这里监听的是主线程的RunLoop
     第二个参数 CFRunLoopObserverRef observer 监听者
     第三个参数 CFStringRef mode 要监听RunLoop在哪种运行模式下的状态
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    
    /*
     CF的内存管理（Core Foundation）
     凡是带有Create、Copy、Retain等字眼的函数，创建出来的对象，都需要在最后做一次release
     GCD本来在iOS6.0之前也是需要我们释放的，6.0之后GCD已经纳入到了ARC中，所以我们不需要管了
     */
//    CFRelease(observer);
}

@end
