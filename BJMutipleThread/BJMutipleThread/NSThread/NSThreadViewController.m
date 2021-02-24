//
//  NSThreadViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSString *imageURL;
@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.imageURL = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*zF0J7XHubBjojgJdYRS0FA.jpeg";
}

#pragma mark - 动态创建线程（先创建，再启动）
- (void)dynamicCreateThread{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImageAction:) object:self.imageURL];
    thread.threadPriority = 1;//设置线程优先级(0.0 - 1.0，1.0最高级)
    [thread start];
}

#pragma mark - 静态创建线程（创建后自动启动）
- (void)staticCreateThread{
    [NSThread detachNewThreadSelector:@selector(loadImageAction:) toTarget:self withObject:self.imageURL];
}

#pragma mark - NSObject创建并自动启动
- (void)implicitCreateThread{
    [self performSelectorInBackground:@selector(loadImageAction:) withObject:self.imageURL];
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
        cell.textLabel.text = @"动态创建线程（先创建，再启动）";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"静态创建线程（创建后自动启动）";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"NSObject创建并自动启动";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.titleImageView setImage:nil];
    
    if (indexPath.row == 0) {
        [self dynamicCreateThread];
    }else if (indexPath.row == 1){
        [self staticCreateThread];
    }else if (indexPath.row == 2){
        [self implicitCreateThread];
    }
}


@end
