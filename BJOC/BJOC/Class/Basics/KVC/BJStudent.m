//
//  BJStudent.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJStudent.h"

@interface BJStudent (){
    // KVC 的赋值顺序，从上到下
    NSString *_name;
    NSString *_isName;
    NSString *name;
    NSString *isName;
}

@end

@implementation BJStudent


- (instancetype)init
{
    self = [super init];
    if (self) {
//        myName = @"hello";
//        NSLog(@"%@",myName);
    }
    return self;
}

// 默认会返回YES
//+ (BOOL)accessInstanceVariablesDirectly{//改为NO之后会执行下面的方法
//    return NO;
//}
//
//- (id)valueForUndefinedKey:(NSString *)key{//这段代码会报Crash，重写后不会Crash
//    NSLog(@"%s",__func__);
//    NSLog(@"出现异常，该key不存在%@",key);
//    return nil;
//}
//
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key{//这段代码会报Crash，重写后不会Crash
//    NSLog(@"%s",__func__);
//    NSLog(@"出现异常，该key不存在%@",key);
//}

@end
