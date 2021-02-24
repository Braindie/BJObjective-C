//
//  BJThreadSafeViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/3/25.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJThreadSafeViewController.h"

@interface BJThreadSafeViewController ()
@property (nonatomic, strong) NSMutableArray *mutableArray;
@end

@implementation BJThreadSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.mutableArray = [NSMutableArray arrayWithCapacity:5];
    for (NSInteger i = 0; i < 5; i++) {
        [self.mutableArray addObject:[NSString stringWithFormat:@"objc - %ld",(long)i]];
    }
    
    [self test];
    
}

//@synchronized会先暂停一个线程A，暂停期间允许另一个线程B访问，当B线程执行完成后A线程才会执行。（这是只有两个线程的时候，如果是多个线程，则由@synchronized修饰的代码块执行期间是只有一个线程在跑，其他线程都暂停）。

- (void)test{
    NSString *str = @"str";
    NSString *faa = @"faa";
    
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        [self updateMutableArray:str];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self) {
            [self updateMutableArray:faa];
        }
    });
    
//    dispatch_barrier_async(queue, ^{
//        [self updateMutableArray:faa];
//    });
}

- (void)updateMutableArray:(NSString *)value{
    // 加到这个方法外面无效，感觉类似于barrier栅栏函数
    @synchronized (self) {
        for (NSInteger i = 0; i < self.mutableArray.count; i++) {
            NSString *str = [self.mutableArray objectAtIndex:i];
            [self.mutableArray replaceObjectAtIndex:i withObject:[str stringByAppendingFormat:@"-%@",value]];
            NSLog(@"%@",[self.mutableArray objectAtIndex:i]);
        }
    }
}

@end
