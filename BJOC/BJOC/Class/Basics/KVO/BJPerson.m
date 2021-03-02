//
//  BJPerson.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJPerson.h"

@implementation BJPerson

//- (void)setAge:(NSString *)age{
//    _age = age;
//    
////    _NSSetIntValueAndNotify();
//
//    NSLog(@"%s",__func__);//2
//}
//
//
//- (void)willChangeValueForKey:(NSString *)key{
//    [super willChangeValueForKey:key];
//    
//    NSLog(@"%s",__func__);//1
//}
//
//- (void)didChangeValueForKey:(NSString *)key{
//    
//    NSLog(@"didChangeValueForKey---begin");//3
//    
//    [super didChangeValueForKey:key];//4(observeValueForKeyPath)
//    
//    NSLog(@"didChangeValueForKey---end");//5
//
//}

// 伪代码
//void _NSSetIntValueAndNotify() {
//    [self willChangeValueForKey:@"age"];
//    [super setAge:age];
//    [self didChangeValueForKey:@"age"];
//}

//- (void)didChangeValueForKey:(NSString *)key {
//    // 通知监听器，某某属性值发生了改变
//    [oberser observeValueForKeyPath:key ofObject:self change:nil context:nil];
//}

@end
