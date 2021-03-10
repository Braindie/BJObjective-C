//
//  BJRuntimeForwordViewController.m
//  BJRuntime
//
//  Created by zhangwenjun on 2019/3/21.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJRuntimeForwordViewController.h"
#import <objc/runtime.h>

//#import "BJSelfAndSuperViewController.h"

@interface BJRuntimeForwordViewController ()

@end

@implementation BJRuntimeForwordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self performSelector:@selector(foo)];
}

/**
 *   拯救方法一：Method Resolution
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    如果 resolve 方法返回 NO ，运行时就会移到下一步：消息转发（Message Forwarding）。
    return NO;
    
    if (sel == @selector(foo)) {
        class_addMethod([self class], sel, (IMP)fooMethod, "v@:");//"v@:"描述SEL对应的函数实现
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void fooMethod(id obj, SEL _cmd){
    NSLog(@"Do foo: %@",obj);
}


/**
 *   拯救方法二：Fast forwarding
 */
- (id)forwardingTargetForSelector:(SEL)aSelector{
//    只要这个方法返回的不是 nil 和 self，整个消息发送的过程就会被重启，当然发送的对象会变成你返回的那个对象。否则，就会继续 Normal Fowarding 。
//    这里叫 Fast ，只是为了区别下一步的转发机制。因为这一步不会创建任何新的对象，但下一步转发会创建一个 NSInvocation 对象，所以相对更快点。
    
//    BJSelfAndSuperViewController *firstVC = [[BJSelfAndSuperViewController alloc] init];
//    if ([firstVC respondsToSelector:aSelector]){
//        return firstVC;
//    }
    
    return [super forwardingTargetForSelector:aSelector];
}

/**
 *   拯救方法三：Normal forwarding
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSInvocation 实际上就是对一个消息的描述，包括selector 以及参数等信息。
//    修改传进来的 NSInvocation 对象，然后发送 -invokeWithTarget: 消息给它，传进去一个新的目标：
//    SEL sel = anInvocation.selector;
//    
//    BJSelfAndSuperViewController *firstVC = [[BJSelfAndSuperViewController alloc] init];
//
//    if ([firstVC respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:firstVC];
//    }else{
//        [self doesNotRecognizeSelector:sel];
//    }
    
}
//如果返回 nil ，Runtime 则会发出 -doesNotRecognizeSelector: 消息，程序这时也就挂掉了。
//如果返回了一个函数签名，Runtime 就会创建一个 NSInvocation 对象并发送 -forwardInvocation: 消息给目标对象。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    NSString *selectorName = NSStringFromSelector(aSelector);
    if ([selectorName isEqualToString:@"foo"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return nil;
}

- (void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"...");
}

@end
