//
//  BJCloseGCDViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/3/13.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJCloseGCDViewController.h"

@interface BJCloseGCDViewController ()
@property (nonatomic, assign) BOOL isStop;
@end

@implementation BJCloseGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关闭线程";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 64, 100, 100);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"开始线程" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 200, 100, 100);
    btn1.backgroundColor = [UIColor orangeColor];
    [btn1 setTitle:@"关闭线程" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    

    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t block1 = dispatch_block_create(0, ^{
        NSLog(@"block1");
    });
    dispatch_block_t block2 = dispatch_block_create(0, ^{
        NSLog(@"block2");
    });
    
    dispatch_async(queue, block1);
    dispatch_async(queue, block2);
    //GCD关闭未进行的线程
    dispatch_block_cancel(block2);
    
}

- (void)startBtnAction{
    self.isStop = NO;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (long i = 0; i<10000; i++) {
            NSLog(@"正在执行第%ld",i);
            sleep(1);
            if (self.isStop) {
                NSLog(@"线程终止");
                return ;//GCD关闭未进行与已进行的线程
            }
        }
    });
}

- (void)closeBtnAction{
    self.isStop = YES;
}

@end
