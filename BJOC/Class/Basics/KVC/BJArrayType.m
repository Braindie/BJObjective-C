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


- (void)addItem{//无法触发KVO
    [_array addObject:@"1"];
}

- (void)addItemObserver{//触发KVO
    [[self mutableArrayValueForKey:@"array"] addObject:@"1"];
}

- (void)removeItemObserver{//触发KVO
    [[self mutableArrayValueForKey:@"array"] removeLastObject];
}





@end
