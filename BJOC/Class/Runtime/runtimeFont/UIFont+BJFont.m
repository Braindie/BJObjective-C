//
//  UIFont+BJFont.m
//  BJRuntime
//
//  Created by zhangwenjun on 2017/8/2.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import "UIFont+BJFont.h"
#import <objc/runtime.h>

#define kWidth [[UIScreen mainScreen] bounds].size.width

@implementation UIFont (BJFont)


+ (void)load {
    Method myFontSize = class_getClassMethod(self, @selector(myFontOfSize:));
    Method systemFontSize = class_getClassMethod(self, @selector(systemFontOfSize:));
    method_exchangeImplementations(myFontSize, systemFontSize);
    
}

+ (UIFont *)myFontOfSize:(CGFloat)fontSize{
    CGFloat currentSize = fontSize*kWidth/320;
//    NSLog(@"currentSize == %f",currentSize);
    UIFont *font = [UIFont fontWithName:@"STHeitiTC-Light" size:currentSize];
    return font;
}


@end
