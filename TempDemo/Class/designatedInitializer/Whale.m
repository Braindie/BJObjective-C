//
//  Whale.m
//  TempDemo
//
//  Created by zhangwenjun on 2018/11/9.
//  Copyright © 2018 zcgt_ios_01. All rights reserved.
//

#import "Whale.h"

@implementation Whale

/**
 *   指定初始化函数
 */
- (instancetype)initWhale{
    
    self = [super initWithName:@"Whale" andLegs:0];
    if (self) {
        _canSwim = YES;
    }
    
    return self;
}
    
- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger)numberOfLegs{
    return [self initWhale];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"Name: %@, Numberof Legs %zd, CanSwim %@", _name, _numberOfLegs, _canSwim ? @"YES" : @"NO"];
}
    
@end
