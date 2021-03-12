//
//  BJPerson.m
//  BJOC
//
//  Created by zhangwenjun on 2019/11/13.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJPerson.h"

@implementation BJPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self personTest];
    }
    return self;
}

- (void)personTest {
    NSLog(@"123");
}

@end
