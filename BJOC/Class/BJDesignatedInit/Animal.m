//
//  Animal.m
//  BJProperty
//
//  Created by zhangwenjun on 2019/2/13.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "Animal.h"

@implementation Animal

/**
 *   指定初始化函数
 */
- (instancetype)initWithName:(NSString *)name
{
    NSLog (@"%s",__func__);
    self = [super init];
    if (self) {
        _name = name;
    }
    
    return self;
}

/**
 *   重写父类指定初始化函数，返回本类指定初始化函数
 */
- (instancetype)init
{
    NSLog (@"%s",__func__);
    return [self initWithName:@"Animal"];
}


@end



@implementation Mammal
/**
 *   指定初始化函数
 */
- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger)numberOfLegs
{
    NSLog (@"%s",__func__);
    self = [super initWithName:name];
    if (self) {
        _numberOfLegs = numberOfLegs;
    }
    
    return self;
}

/**
 *   重写父类指定初始化函数，返回本类指定初始化函数
 */
- (instancetype)initWithName:(NSString *)name
{
    NSLog (@"%s",__func__);
    return [self initWithName:name andLegs:4];
}


/**
 *   便利初始化函数
 */
- (instancetype)initWithLegs:(NSInteger)numberOfLegs
{
    NSLog (@"%s",__func__);
    self = [self initWithName:@"Mammal"];
    if (self) {
        _numberOfLegs = numberOfLegs;
    }
    
    return self;
}


@end




@implementation Whale
/**
 *   指定初始化函数
 */
- (instancetype)initWhale
{
    NSLog (@"%s",__func__);
    self = [super initWithName:@"Whale" andLegs:0];
    if (self) {
        _canSwim = YES;
    }
    
    return self;
}

/**
 *   重写父类指定初始化函数，返回本类指定初始化函数
 */
- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger)numberOfLegs
{
    NSLog (@"%s",__func__);
    return [self initWhale];
}




//一般情况下，我们在使用`NSLog`和`%@`输出某个对象时，就会调用这个对象的`description`方法，它的返回值就是`NSString`字符串类型，所以`description`默认实现返回的格式是`<类名: 对象的内存地址>`
- (NSString *)description{
    return [NSString stringWithFormat:@"Name: %@, Numberof Legs %zd, CanSwim %@", _name, _numberOfLegs, _canSwim ? @"YES" : @"NO"];
}

@end
