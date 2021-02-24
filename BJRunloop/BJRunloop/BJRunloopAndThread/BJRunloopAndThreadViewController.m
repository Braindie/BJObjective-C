//
//  BJRunloopAndThreadViewController.m
//  BJRunloop
//
//  Created by zhangwenjun on 2019/3/26.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJRunloopAndThreadViewController.h"

@interface BJRunloopAndThreadViewController ()
@property (nonatomic, strong) NSThread *keepThread;
@end

@implementation BJRunloopAndThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //多线程中runloop的创建
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(newThread) object:nil];
//    [thread start];
    
    //常驻线程
    self.keepThread = [[NSThread alloc] initWithTarget:self selector:@selector(keepThreadAction) object:nil];
    [self.keepThread start];
}

#pragma mark - Runloop的创建
- (void)newThread{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    //获取当前线程runloop的时候创建runloop
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    
    NSLog(@"%@",runloop);
    
    //给当前的RunLoop添加一个内容为timer的而且属性是NSDefaultRunLoopMode的mode。
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //多线程需要run跑起来（如果runloop里面不加内容，跑起来就结束了，因为主线程默认是run的，所以不用加这句话）
    [runloop run];
    
}

- (void)timerAction{
    NSLog(@"---");
}

#pragma mark - 常驻线程
- (void)keepThreadAction{
    NSLog(@"0.0");
    
    //给当前的RunLoop添加一个内容为Sourse的而且属性是NSDefaultRunLoopMode的mode。
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    
    // run : 一旦调用这个方法开启子线程的运行循环,就不会停止，一旦开启运行循环,相当于就开启了死循环，主线程默认开启
    //下面的代码把self.thread变成了常驻线程，可随时添加任务，并交于RunLoop处理
    [[NSRunLoop currentRunLoop] run];
    
    
    //如果开启RunLoop，则来不了这里，因为RunLoop开启了循环。
    NSLog(@"1.1");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //在self.keepThread线程中执行方法
    [self performSelector:@selector(otherThreadAction) onThread:self.keepThread withObject:nil waitUntilDone:YES];
}

- (void)otherThreadAction{
    NSLog(@"多线程执行的");
}

@end
