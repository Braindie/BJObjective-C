//
//  BJDelegateViewController.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/7.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJDelegateViewController.h"
#import "BJDelegateView.h"

@interface BJDelegateViewController ()<BJDelegateViewDelegate, BJDelegate>

@property (nonatomic, strong) BJDelegateView *bjView;

@end

@implementation BJDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    _bjView = [[BJDelegateView alloc] initWithFrame:CGRectMake(0, 64, 300, 300)];
    _bjView.delegate = self;
    _bjView.bjDelegate = self;
    _bjView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_bjView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)dealloc
{
    NSLog(@"销毁了");
}

#pragma mark - delegate
- (void)clickBtnAction{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)toDoSomething {
    self.view.backgroundColor = [UIColor redColor];
}


@end
