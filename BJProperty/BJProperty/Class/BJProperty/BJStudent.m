//
//  BJStudent.m
//  BJProperty
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJStudent.h"

@implementation BJStudent

- (instancetype)initWithName:(NSString *)name age:(int)age sex:(NSString *)sex
{
    if(self = [super init]){
        self.name = name;
        _sex = sex;
        self.age = age;
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    // 注意，copy的是自己，因此使用自己的属性
    BJStudent *stu = [[BJStudent allocWithZone:zone] initWithName:self.name age:self.age sex:_sex];
    return stu;
}

@end
