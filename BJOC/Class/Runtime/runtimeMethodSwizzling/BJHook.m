//
//  BJHook.m
//  BJOC
//
//  Created by 张文军 on 2020/12/3.
//  Copyright © 2020 zcgt_ios_01. All rights reserved.
//

#import "BJHook.h"
#import <objc/runtime.h>

@implementation BJHook

+ (void)hookClass:(Class)classObject fromSelector:(SEL)fromSelector toSelector:(SEL)toSelector {
    
    Class class = classObject;
    
    Method fromMethod = class_getInstanceMethod(class, fromSelector);
    
    Method toMethod = class_getInstanceMethod(class, toSelector);
    
    if (class_addMethod(class, fromSelector, method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        class_replaceMethod(class, toSelector, method_getImplementation(fromMethod), method_getTypeEncoding(toMethod));
    } else {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}

@end
