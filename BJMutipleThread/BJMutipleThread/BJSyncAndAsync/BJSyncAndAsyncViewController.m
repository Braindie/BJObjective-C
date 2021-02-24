//
//  BJSyncAndAsyncViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/3/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJSyncAndAsyncViewController.h"

@interface BJSyncAndAsyncViewController ()

@end

@implementation BJSyncAndAsyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //组间异步，组内同步
//    [self test1];
    
    //组间同步，组内异步（好像是错的）
    [self test2];
 
}

- (void)test1{
    
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_t group = dispatch_group_create();//调度组
    
    
    
    dispatch_group_async(group, queue1, ^{
        
        dispatch_sync(queue1, ^{
            for (int i = 0; i < 10000; i ++) {}
            NSLog(@"任务-A1");
        });
        
        dispatch_sync(queue1, ^{
            NSLog(@"任务-A2");
        });
        
        dispatch_sync(queue1, ^{
            NSLog(@"任务-A3");
        });
    });
    
    dispatch_group_async(group, queue1, ^{
        
        dispatch_sync(queue1, ^{
            NSLog(@"任务-B1");
        });
        
        dispatch_sync(queue1, ^{
            for (int i = 0; i < 10000; i ++) {}
            NSLog(@"任务-B2");
        });
        
        dispatch_sync(queue1, ^{
            NSLog(@"任务-B3");
        });
    });
    
    
    
    dispatch_group_async(group, queue1, ^{
        
        dispatch_sync(queue1, ^{
            NSLog(@"任务-C1");
        });
        
        dispatch_sync(queue1, ^{
            NSLog(@"任务-C2");
        });
        
        dispatch_sync(queue1, ^{
            for (int i = 0; i < 10000; i ++) {}
            NSLog(@"任务-C3");
        });
    });
    

    dispatch_group_notify(group, queue1, ^{
        NSLog(@"结束");
    });
}


- (void)test2{
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_t group = dispatch_group_create();
    

    dispatch_sync(queue2, ^{
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务-A1");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务-A2");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务-A3");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
    });
    
    
    dispatch_sync(queue2, ^{
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务--B1");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务--B2");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务--B3");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
    });
    
    
    dispatch_sync(queue2, ^{
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务---C1");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务---C2");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
        dispatch_group_async(group, queue2, ^{
            NSLog(@"任务---C3");
            NSLog(@"%@",[NSThread currentThread]);
        });
        
    });
    
    
    dispatch_group_notify(group, queue2, ^{
        NSLog(@"结束");
    });
}


@end
