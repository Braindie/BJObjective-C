//
//  BJuseCODEinit.m
//  BJProperty
//
//  Created by zhangwenjun on 17/4/6.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import "BJuseCODEinit.h"

@implementation BJuseCODEinit

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setNeedsLayout];
//        [self layoutIfNeeded];
//        [self setNeedsDisplay];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor blackColor];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        NSLog(@"%s",__func__);

    }
    return self;
}

#warning 不调用哦
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"%s",__func__);

    }
    return self;
}
#warning 不调用哦
- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s",__func__);
}


- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"%s",__func__);

}

- (void)drawRect:(CGRect)rect{
    NSLog(@"%s",__func__);

}



- (void)btnAction:(UIButton *)sender{
    //马上调用layoutSubviews
    [self setNeedsLayout];

//    [self layoutIfNeeded];
}

@end
