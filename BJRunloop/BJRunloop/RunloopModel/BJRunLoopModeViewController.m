//
//  BJRunLoopModeViewController.m
//  BJRunloop
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJRunLoopModeViewController.h"

@interface BJRunLoopModeViewController ()
@property (nonatomic, strong) NSTimer *defaultTimer;
@property (nonatomic, strong) NSTimer *commonTimer;

@end

@implementation BJRunLoopModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //销毁方式，请看隔壁
    [self.defaultTimer invalidate];
    self.defaultTimer = nil;

    [self.commonTimer invalidate];
    self.commonTimer = nil;
}

#pragma mark -
- (void)dealloc
{
    NSLog(@"销毁");
}

/**
 *   Core Foundation中的Mode
 */
/*
    kCFRunLoopDefaultMode //App的默认Mode，通常主线程是在这个Mode下运行
    UITrackingRunLoopMode //界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
    UIInitializationRunLoopMode // 在刚启动 App 时第进入的第一个 Mode，启动完成后就不再使用
    GSEventReceiveRunLoopMode // 接受系统事件的内部 Mode，通常用不到
    kCFRunLoopCommonModes //这是一个占位用的Mode，不是一种真正的Mode
 */


- (IBAction)defautBtnAction:(id)sender {

    //一、此方法会自动添加到当前的Runloop中，而且运行模式为kCFRunLoopDefaultMode
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(NSDefaultRunLoopModeTimerAction) userInfo:nil repeats:YES];
    
    
    //二、此方法需要手动添加到Runloop中,才能运行
    //当textFiled滑动的时候，timer失效，停止滑动时，timer恢复
    //原因：当textFiled滑动的时候，RunLoop的Mode会自动切换成UITrackingRunLoopMode模式，因此timer失效，当停止滑动，RunLoop又会切换回NSDefaultRunLoopMode模式，因此timer又会重新启动了
    self.defaultTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(NSDefaultRunLoopModeTimerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.defaultTimer forMode:NSDefaultRunLoopMode];
    
    
//    NSLog (@"%s",__func__);
//    NSLog(@"-----%@",[NSRunLoop currentRunLoop]);
}



- (IBAction)commenBtnAction:(id)sender {
    

    //如果把mode改为kCFRunLoopCommonModes的话就可以既支持kCFRunLoopDefaultMode又支持UITrackingRunLoopMode了。
    //此modes情况下滑动ScrollView定时器仍然会工作
    //使用站位的运行模式 NSRunLoopCommonModes标记，凡是被打上NSRunLoopCommonModes标记的都可以运行，下面两种模式被打上标签
    /*
    0 : <CFString 0x114807be0 [0x1112deb68]>{contents = "UITrackingRunLoopMode"}
    2 : <CFString 0x1112f4168 [0x1112deb68]>{contents = "kCFRunLoopDefaultMode"}
     */
    // 因此也就是说如果我们使用NSRunLoopCommonModes，timer可以在UITrackingRunLoopMode，kCFRunLoopDefaultMode两种模式下运行

    self.commonTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(NSRunLoopCommonModesTimerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.commonTimer forMode:NSRunLoopCommonModes];
    
    
//    NSLog (@"%s",__func__);
//    NSLog(@"-----%@",[NSRunLoop currentRunLoop]);
}


- (void)NSDefaultRunLoopModeTimerAction
{
    NSLog(@"NSDefaultRunLoopMode----");
}

- (void)NSRunLoopCommonModesTimerAction
{
    NSLog(@"----NSRunLoopCommonModes");
}



- (IBAction)buttonAction:(id)sender {
    
    NSLog (@"%s",__func__);
    NSLog(@"-----%@",[[NSRunLoop currentRunLoop] currentMode]);
}


@end
