//
//  BJTimerCycleViewController.m
//  BJRunloop
//
//  Created by zhangwenjun on 2019/3/7.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJTimerCycleViewController.h"
#import "NSTimer+BJAddition.h"

@interface BJTimerCycleViewController ()

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation BJTimerCycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /*
     1.如果不提前销毁timer会导致循环引用，dealloc不会调用
     */
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    /*
     2.如果使用这个分类，dealloc会销毁，但是定时器还会一直执行，可在dealloc中销毁定时器
     此方法说明：关键在于把保留转移到了定时器的类对象身上，这样就避免了实例对象被保留。需要weakSelf
     */
    //    __weak typeof(self) weakSelf = self;
    //    self.timer = [NSTimer addScheduledTimerWithTimeInterval:1.0 repeats:YES block:^{
    //        [weakSelf timerRepeatAction];
    //    }];
    //    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    /*
     3.iOS10中，定时器的API新增了block方法，实现原理与此类似，这里采用分类为NSTimer添加了带有block参数的方法，而系统是在原始类中直接添加方法，最终的行为是一致的。需要weakSelf
     */
    //    self.timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //        [self timerRepeatAction];
    //    }];
    //    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //    [self.timer invalidate];
    //    self.timer = nil;
}


- (void)dealloc
{
    NSLog(@"销毁了");
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark -
- (void)timerAction:(NSTimer *)timer{
    NSLog(@"1");
}

- (void)timerRepeatAction {
    NSLog(@"1");
}

@end
