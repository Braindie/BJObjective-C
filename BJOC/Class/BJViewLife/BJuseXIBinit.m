//
//  BJuseXIBinit.m
//  BJProperty
//
//  Created by zhangwenjun on 17/4/6.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import "BJuseXIBinit.h"

@implementation BJuseXIBinit

+ (instancetype)initBJuseXIBinit{
    return [[[NSBundle mainBundle] loadNibNamed:@"BJuseXIBinit" owner:self options:nil] lastObject];
}

#warning 不调用哦
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s",__func__);
    }
    return self;
}


- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s",__func__);
}

/**
 *  从文件中解析一个对象的时候就会调用这个方法
 *  通过xib或者storyboard创建UI控件就会调用这个方法
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        // 代码
        NSLog(@"%s",__func__);

    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"%s",__func__);
    
}

- (void)drawRect:(CGRect)rect{
    NSLog(@"%s",__func__);
    
}

- (IBAction)btnAction:(id)sender {
    
    //会调drawRect方法
//    self.backgroundColor = [UIColor brownColor];
    
    self.layoutHeight.constant = self.frame.size.height/2;
    [self layoutIfNeeded];
}





@end
