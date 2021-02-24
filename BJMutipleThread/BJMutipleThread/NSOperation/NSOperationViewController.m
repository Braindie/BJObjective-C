//
//  NSOperationViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "NSOperationViewController.h"
#import "BJCustomOperation.h"

@interface NSOperationViewController ()<UITableViewDelegate,UITableViewDataSource,BJloadImageDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSString *imageURL;

@end

@implementation NSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.imageURL = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*kE8-X3OjeiiSPQFyhL2Tdg.jpeg";
}

#pragma mark - NSInvocationOperation
- (void)useNSInvocationOperation{
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadImageAction:) object:self.imageURL];
//    [invocationOperation start];//直接在当前主线程执行
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:invocationOperation];
}

#pragma mark - NSBlockOperation
- (void)useNSBlockOperation{
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self loadImageAction:self.imageURL];
    }];
    
//    for (NSInteger i = 0; i < 5; i++) {
//        //给blockOperation添加多个执行block，blockOperation中的任务会并发执行（必须在start方法之前）
//        [blockOperation addExecutionBlock:^{
//            NSLog(@"第%ld次：%@",i,[NSThread currentThread]);
//        }];
//    }
//    [blockOperation start];//同步执行
    
    //只要添加到队列，会自动调用任务的start方法
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //最大并发数，用来设置最多可以让多少个任务同时执行，设置为1时就是串行了
    queue.maxConcurrentOperationCount = 1;
    [queue addOperation:blockOperation];
    
    
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"打水印 - %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载图片 - %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
    }];
    
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"上传图片 - %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
    }];
    
    
    //设置依赖
    [operation1 addDependency:operation2];
    [operation3 addDependency:operation2];
    
    //创建队列并加入任务
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    [myQueue addOperations:@[operation1, operation2, operation3] waitUntilFinished:NO];
    
    /*
     注意：
     1、不能添加相互依赖，会死锁，比如：A依赖B，B依赖A
     2、可以使用removeDependency来接触依赖关系
     3、可以在不同的队列之间依赖，反正就是这个依赖是添加到任务身上的，和队列没关系
     */
    
    
    
    //线程同步
    //互斥锁：给需要同步的代码加一个互斥锁，可以保证每次只有一个线程访问此代码
    @synchronized (self) {
        //需要执行的代码块
    }
}
#pragma mark - NSOperation
- (void)useNSOperation{
    BJCustomOperation *operation = [BJCustomOperation new];
    operation.delegate = self;
    operation.imageUrl = self.imageURL;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
//    在运行任务前，可以在NSOperation对象上调用cancel方法，用以表明此任务不需要执行。不过已经启动的任务无法取消。
//    [operation cancel];
//    [queue cancelAllOperations];
    
}

- (void)loadImageFinish:(UIImage *)image{
    [self.titleImageView setImage:image];
}

#pragma mark -
- (void)loadImageAction:(NSString *)url{
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imageData];
    if (imageData != nil) {
        [self performSelectorOnMainThread:@selector(refreshImageView:) withObject:image waitUntilDone:YES];
    }else{
        NSLog(@"no image data");
    }
}

- (void)refreshImageView:(UIImage *)image{
    [self.titleImageView setImage:image];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"NSInvocationOperation";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"NSBlockOperation";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"自定义NSOperation（未启动的任务可取消）";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.titleImageView setImage:nil];
    
    if (indexPath.row == 0) {
        [self useNSInvocationOperation];
    }else if (indexPath.row == 1){
        [self useNSBlockOperation];
    }else if (indexPath.row == 2){
        [self useNSOperation];
    }
}


@end
