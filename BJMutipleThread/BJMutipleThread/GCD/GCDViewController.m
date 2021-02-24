//
//  GCDViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSString *_imgUrl1;
    NSString *_imgUrl2;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _imgUrl1 = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*zF0J7XHubBjojgJdYRS0FA.jpeg";
    _imgUrl2 = @"https://d262ilb51hltx0.cloudfront.net/fit/t/880/264/1*kE8-X3OjeiiSPQFyhL2Tdg.jpeg";
}

-(void)loadImageSource:(NSString *)url{
    
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    if (imgData!=nil) {
        [self performSelectorOnMainThread:@selector(refreshImageView1:) withObject:image waitUntilDone:YES];
    }else{
        NSLog(@"there no image data");
    }
}

-(void)refreshImageView1:(UIImage *)image{
    [self.imageView1 setImage:image];
}

-(UIImage *)loadImage:(NSString *)url{

    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:imgData];
    if (image!=nil) {
        return image;
    }else{
        NSLog(@"there no image data");
        return image;
    }
}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"dispatch_get_global_queue";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"dispatch_get_main_queue";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"dispatch_once_t";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"dispatch_apply";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"dispatch_get_global_queue2";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"dispatch_group_notify";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"dispatch_after";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"dispatch_queue_t";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.imageView1 setImage:nil];
    [self.imageView2 setImage:nil];
    
    if (indexPath.row == 0) {
        [self useGlobalQueue];
    }else if (indexPath.row == 1){
        [self useMainQueue];
    }else if (indexPath.row == 2){
        [self useDispatchOnce];
    }else if (indexPath.row == 3){
        [self useDispatchApply];
    }else if (indexPath.row == 4){
        [self useGlobalQueue2];
    }else if (indexPath.row == 5){
        [self useDispatchNofify];
    }else if (indexPath.row == 6){
        [self useDispatchAfter];
    }else if (indexPath.row == 7){
        [self useDispatchQueuet];
    }
}



#pragma mark - dispatch_get_global_queue
//异步，后台线程执行
- (void)useGlobalQueue{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self loadImageSource:self->_imgUrl1];
    });
}

#pragma mark - dispatch_get_main_queue
//异步，主线程(只是为了测试，长时间的加载不能放在主线程）
- (void)useMainQueue{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self loadImageSource:self->_imgUrl1];
    });
}

#pragma mark - dispatch_once_t
//一次性执行，常用来写单例（主线程）
- (void)useDispatchOnce{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self loadImageSource:self->_imgUrl1];
    });
}

#pragma mark - dispatch_apply
//按指定的次数将指定的Block追加到指定的Queue中，并等待全部处理执行结束
- (void)useDispatchApply{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    size_t count = 10;
    dispatch_apply(count, queue, ^(size_t i) {
        NSLog(@"执行第%li次",i);
    });
    NSLog(@"执行结束");
}

#pragma mark - dispatch_get_global_queue
//5、后台执行：加载两张图片
-(void)useGlobalQueue2{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *image1 = [self loadImage:_imgUrl1];
        UIImage *image2 = [self loadImage:_imgUrl2];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView1.image = image1;
            self.imageView2.image = image2;
        });
    });
}


#pragma mark - dispatch_group_notify
//并发线程组
- (void)useDispatchNofify{
    dispatch_group_t group = dispatch_group_create();
    
    __block UIImage *image1 = nil;
    __block UIImage *image2 = nil;
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        image1 = [self loadImage:_imgUrl1];
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        image2 = [self loadImage:_imgUrl2];
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.imageView1.image = image1;
        self.imageView2.image = image2;
    });
}

#pragma mark - dispatch_after
//延迟执行
- (void)useDispatchAfter{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadImageSource:_imgUrl1];
    });
}

#pragma mark - dispatch_queue_t
//自定义dispatch_queue_t
- (void)useDispatchQueuet{
    dispatch_queue_t queue_t = dispatch_queue_create("bj", NULL);
    dispatch_async(queue_t, ^{
        [self loadImageSource:_imgUrl1];
    });
}

@end
