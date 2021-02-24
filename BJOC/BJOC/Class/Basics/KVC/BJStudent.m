//
//  BJStudent.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJStudent.h"

@interface BJStudent (){
    NSString *_name;
    NSString *myName;//实例变量
}

@end

@implementation BJStudent

//- (void)setName:(NSString *)name{
//    myName = name;
//}
//- (NSString *)name{
//    return myName;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        myName = @"hello";
        NSLog(@"%@",myName);
    }
    return self;
}


+ (BOOL)accessInstanceVariablesDirectly{//默认会返回YES，改为NO之后会执行下面的方法
    return NO;
}

- (id)valueForUndefinedKey:(NSString *)key{//这段代码会报Crash，重写后不会Crash
    NSLog(@"%s",__func__);
    NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{//这段代码会报Crash，重写后不会Crash
    NSLog(@"%s",__func__);
    NSLog(@"出现异常，该key不存在%@",key);
}

@end
