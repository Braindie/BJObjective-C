//
//  BJMethodPerson.m
//  BJRuntime
//
//  Created by 张文军 on 2021/3/11.
//


/*
 
 struct method_t {
     SEL name; // 函数名
     const char *types; // 编码（返回值类型，参数类型）
     MethodListIMP imp; // 指向函数的指针
 };
 
 */

#import "BJMethodPerson.h"

@implementation BJMethodPerson

- (void)test {
    NSLog(@"测试测试测试");
//    NSLog(@"%s", __func__);
}

@end
