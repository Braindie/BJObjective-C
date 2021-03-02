//
//  NSKVONotifying_BJPerson.m
//  BJOC
//
//  Created by 张文军 on 2021/3/2.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//


// 不参与编译

#import "NSKVONotifying_BJPerson.h"

@implementation NSKVONotifying_BJPerson


- (void)setAge:(int)age {
    _NSSetIntValueAndNotify();
}

// 屏幕内部实现，隐藏了NSKVONotifying_MJPerson类的存在
- (Class)class
{
    return [BJPerson class];
}

- (void)dealloc
{
    // 收尾工作
}

- (BOOL)_isKVOA
{
    return YES;
}


@end
