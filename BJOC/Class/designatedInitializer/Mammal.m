
//
//  Mammal.m
//  TempDemo
//
//  Created by zhangwenjun on 2018/11/9.
//  Copyright © 2018 zcgt_ios_01. All rights reserved.
//

#import "Mammal.h"

@implementation Mammal

/**
 *   指定初始化函数
 */
- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger)numberOfLegs{
    self = [super initWithName:name];
    if (self) {
        _numberOfLegs = numberOfLegs;
    }
    
    return self;
}
    

- (instancetype)initWithLegs:(NSInteger)numberOfLegs{
    self = [self initWithName:@"Mammal"];
    if (self) {
        _numberOfLegs = numberOfLegs;
    }
    
    return self;
}
    

- (instancetype)initWithName:(NSString *)name{
    return [self initWithName:name andLegs:4];
}
@end
