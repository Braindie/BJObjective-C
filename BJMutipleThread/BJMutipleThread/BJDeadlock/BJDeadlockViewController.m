//
//  BJDeadlockViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJDeadlockViewController.h"

@interface BJDeadlockViewController ()

@end

@implementation BJDeadlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //异步，这个block会被放到指定的队列的队尾等待执行；block是并行还是串行只和block里面的参数有关；
    //dispatch_async会马上返回
    //主线程执行，输出1、3、2（会堵塞主线程）
    //官方文档指出：dispatch_sync的当前执行队列与提交block执行的目标队列相同时造成死锁
    //dispatch_get_current_queue容易造成死锁
    
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    sleep(1);
    NSLog(@"3");
  
  
//    NSLog(@"1");
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"2");
//    });
//    sleep(1);
//    NSLog(@"3");
    
    
    
    
    //同步，同样把block放到指定的queue上面执行
    //dispatch_sync会等待这个block执行完毕才回返回
    //主线程执行，
    //主线程锁死，自输出1
    
//    NSLog(@"1");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2");
//    });
//    NSLog(@"3");

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
