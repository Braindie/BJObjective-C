//
//  Animal.m
//  TempDemo
//
//  Created by zhangwenjun on 2018/11/9.
//  Copyright © 2018 zcgt_ios_01. All rights reserved.
//

#import "Animal.h"

@implementation Animal
    
- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}
    
- (instancetype)init{
    return [self initWithName:@"Animal"];
}

@end
