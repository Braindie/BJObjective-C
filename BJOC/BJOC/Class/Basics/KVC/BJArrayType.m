//
//  BJArrayType.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/18.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJArrayType.h"

@implementation BJArrayType

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray new];
        [self addObserver:self forKeyPath:@"array" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"_name" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change);
}


- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"array"];
}

#pragma mark -
// 通过KVC修改实例变量也能触发KVO
- (void)changeInstance {
    [self setValue:@"zhang" forKey:@"_name"];
}

#pragma mark -
//无法触发KVO
- (void)addItem{
    [_array addObject:@"1"];
}

//触发KVO
- (void)addItemObserver{
    // mutableArrayValueForKey为KVC方法
    [[self mutableArrayValueForKey:@"array"] addObject:@"1"];
}

//触发KVO
- (void)removeItemObserver{
    [[self mutableArrayValueForKey:@"array"] removeLastObject];
}





@end
