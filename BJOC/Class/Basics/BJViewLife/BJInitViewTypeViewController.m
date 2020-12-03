//
//  BJInitViewTypeViewController.m
//  BJProperty
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJInitViewTypeViewController.h"
#import "BJuseCODEinit.h"
#import "BJuseXIBinit.h"

@interface BJInitViewTypeViewController ()

/**
 *   代码
 */
@property (nonatomic, strong) BJuseCODEinit *bjCodeInit;
/**
 *   Xib
 */
@property (nonatomic, strong) BJuseXIBinit *bjXibInit;
@end

@implementation BJInitViewTypeViewController

/*
 当类或分类（Category）被加载到 Objective-C runtime 时（就是被引用的时候）被调用的，实现这个方法可以让我们在类加载的时候执行一些类相关的行为。当类被引用进项目的时候就会执行 load 函数（在 main 函数开始执行之前），与这个类是否被用到无关，每个类的 load 函数只会自动调用一次。x
 */
+ (void)load{
  NSLog(@"load");
}

/*
 函数是在类或者其子类的收到第一条消息之前调用。这里所指的消息包括实例方法和类方法的调用。也就是说 initialize 方法是以懒加载的方式被调用的，如果程序一直没有给某个类或它的子类发送消息，那么这个类的 initialize 方法是永远不会被调用的。
 */
+ (void)initialize{
  NSLog(@"initialize");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%s",__func__);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%s",__func__);
    
    
    
#pragma mark - 使用xib和代码初始化View的区别
    
//    self.bjCodeInit = [[BJuseCODEinit alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    self.bjCodeInit.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.bjCodeInit];
    
    self.bjXibInit = [BJuseXIBinit initBJuseXIBinit];
    self.bjXibInit.frame = CGRectMake(0, 300, 200, 200);
    self.bjXibInit.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.bjXibInit];
    
}


#pragma mark - 视图控制器的生命周期

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"%s",__func__);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
}

- (void)dealloc{
    //pop时会调用
    NSLog(@"%s",__func__);
}



@end
