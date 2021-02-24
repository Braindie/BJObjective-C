//
//  BJGCDBarrierViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/3/13.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJGCDBarrierViewController.h"

@interface BJGCDBarrierViewController ()

@end

@implementation BJGCDBarrierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"dispatch_barrier_async";
    self.view.backgroundColor = [UIColor whiteColor];
    
    __block NSString *testStr = @"0";
    
    //自定义并行队列
    dispatch_queue_t queue = dispatch_queue_create("barrier", DISPATCH_QUEUE_CONCURRENT);
    

    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 30; i++) {
            sleep(1);
            NSLog(@"testStr == %@",testStr);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 30; i++) {
//            sleep(1);
            testStr = @"1";
            NSLog(@"testStr == %@",testStr);
        }
    });
//    dispatch_barrier_async(queue, ^{
//        for (NSInteger i = 0; i < 30; i++) {
//            sleep(1);
//            testStr = @"1";
//            NSLog(@"testStr == %@",testStr);
//        }
//    });

    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 30; i++) {
            sleep(1);
            NSLog(@"testStr == %@",testStr);
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 30; i++) {
            sleep(1);
            testStr = @"2";
            NSLog(@"testStr == %@",testStr);
        }
    });
//    dispatch_barrier_async(queue, ^{
//        for (NSInteger i = 0; i < 30; i++) {
//            sleep(1);
//            testStr = @"2";
//            NSLog(@"testStr == %@",testStr);
//        }
//    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 30; i++) {
            sleep(1);
            NSLog(@"testStr == %@",testStr);
        }
    });
    
    
    //上面的操作会发生数据竞争，如果把写入操作换成dispatch_barrier_async就好了
    
    
    //在并行队列中，为了保持某些任务的顺序，需要等待一些任务完成后才能继续进行，使用 barrier 来等待之前任务完成，避免数据竞争等问题。
    //dispatch_barrier_async 函数会等待追加到Concurrent Dispatch Queue并行队列中的操作全部执行完之后，然后再执行 dispatch_barrier_async 函数追加的处理，等 dispatch_barrier_async 追加的处理执行结束之后，Concurrent Dispatch Queue才恢复之前的动作继续执行。

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
