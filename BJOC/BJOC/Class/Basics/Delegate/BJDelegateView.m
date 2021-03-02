//
//  BJDelegateView.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/7.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJDelegateView.h"

@implementation BJDelegateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}


- (void)creatUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 300, 50);
    [btn setTitle:@"点击触发代理事件" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 100, 300, 50);
    [btn1 setTitle:@"delegate置为nil" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 addTarget:self action:@selector(btn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn1];
}

- (void)btnAction{

    [self.bjDelegate toDoSomething];
    
//    [self.delegate clickBtnAction];

//    if ([self.delegate respondsToSelector:@selector(clickBtnAction)]) {
//        [self.delegate clickBtnAction];
//    }
}

- (void)btn1Action{
    self.delegate = nil;
}

@end
