//
//  UIControl+BJRuntimeControl.m
//  BJRuntime
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "UIControl+BJRuntimeControl.h"
#import <objc/runtime.h>

#include <libkern/OSAtomic.h>
#include <execinfo.h>

static char * const eventUnavailableKey = "eventUnavailableKey";
static char * const UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

//记住：要用UIControl的分类，因为替换的这个方法（sendAction:to:forEvent:）是UIControl的，其他地方调用了这个方法会因为找不到这个类自定的属性而崩溃
@interface UIControl ()

@property (nonatomic, assign) BOOL eventUnavailable;

@end

@implementation UIControl (BJRuntimeControl)

//在load时执行hook
//UIControl的sendAction:to:forEvent:方法用于处理事件响应.如果我们在该方法的实现中, 添加针对点击事件的时间间隔相关的处理代码, 则能够做到在指定时间间隔中防止重复点击.
//APP启动时就会调用
+ (void)load {
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    SEL originSel = @selector(sendAction:to:forEvent:);
    SEL newSel = @selector(bj_sendAction:to:forEvent:);
    
    Method before   = class_getInstanceMethod(self, originSel);
    Method after    = class_getInstanceMethod(self, newSel);
    method_exchangeImplementations(before, after);
  });
}

// 因category不能添加属性，只能通过关联对象的方式。
// objc_getAssociatedObject、objc_setAssociatedObject这两个方法可以让一个对象和另一个对象关联，就是说一个对象可以保持对另一个对象的引用，并获取那个对象

//关联对象
- (NSTimeInterval)bj_acceptEventInterval {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setBj_acceptEventInterval:(NSTimeInterval)bj_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(bj_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    _object_set_associative_reference
    
    
//    //调用栈信息
//    void* callstack[128];
//    int frames = backtrace(callstack, 128);
//    char **strs = backtrace_symbols(callstack, frames);
//    int i;
//    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
//    for (i = 0;i < 10;i++){
//        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
//    }
//    free(strs);
//    NSLog(@"=====>>>>>堆栈<<<<<=====\n%@",backtrace);
}

//关联对象
- (BOOL)eventUnavailable {
    return [objc_getAssociatedObject(self, eventUnavailableKey) boolValue];
}

- (void)setEventUnavailable:(BOOL)eventUnavailable {
    objc_setAssociatedObject(self, eventUnavailableKey, @(eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)bj_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.eventUnavailable == NO) {
        self.eventUnavailable = YES;
        [self bj_sendAction:action to:target forEvent:event];
        [self performSelector:@selector(setEventUnavailable:) withObject:@(NO) afterDelay:self.bj_acceptEventInterval];
    }
}

@end
