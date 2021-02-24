//
//  BJBarrierViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJBarrierViewController.h"

@interface BJBarrierViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;

@end

@implementation BJBarrierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"dispatch_group_notify";
    
    
    __block UIImage *image1 = [UIImage new];
    __block UIImage *image2 = [UIImage new];
    __block UIImage *image3 = [UIImage new];
    __block UIImage *image4 = [UIImage new];
    
    //一个队列，一个调度组
    //用GCD同步若干个异步调用（并发线程组）
    //若干个url异步加载多张图片，然后全部下载完毕后合成整张图
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//系统队列
    dispatch_group_t group = dispatch_group_create();//调度组
    dispatch_group_async(group, queue, ^{
        
        
        image1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1512038612427&di=c6b1cbf1a8e7b18e2314c0402dfef559&imgtype=0&src=http%3A%2F%2Fimgq.duitang.com%2Fuploads%2Fitem%2F201505%2F02%2F20150502033644_CLRnJ.thumb.700_0.jpeg"]]];
        NSLog(@"加载图片1");

    });
    dispatch_group_async(group, queue, ^{
//        for (int i = 0; i < 1000000; i++) {
//            NSLog(@"11");
//        }
        image2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=282276258,3174737863&fm=27&gp=0.jpg"]]];
        NSLog(@"加载图片2");

    });
    dispatch_group_async(group, queue, ^{
        image3 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1512039015467&di=6bd3cdb88f4d3d9b3ceff20443fe1395&imgtype=0&src=http%3A%2F%2Fimg4q.duitang.com%2Fuploads%2Fitem%2F201502%2F14%2F20150214234720_xAvVW.jpeg"]]];
        NSLog(@"加载图片3");

    });
    dispatch_group_async(group, queue, ^{
        image4 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1740724565,2527912958&fm=27&gp=0.jpg"]]];
        NSLog(@"加载图片4");

    });
    
    //在主线程设置图片
    //当group中queue队列上的所有任务执行完毕时会执行dispatch_group_notify中的block
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.imageView1.image = image1;
        self.imageView2.image = image2;
        self.ImageView3.image = image3;
        self.imageView4.image = image4;
        NSLog(@"合成图片");

    });


}


@end
