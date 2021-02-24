//
//  NSTimer+BJAddition.m
//  BJRunloop
//
//  Created by zhangwenjun on 2019/3/7.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "NSTimer+BJAddition.h"

@implementation NSTimer (BJAddition)


+ (NSTimer *)addScheduledTimerWithTimeInterval:(NSTimeInterval)time
                                       repeats:(BOOL)repeats
                                         block:(void(^)(void))block{
    return [self scheduledTimerWithTimeInterval:time
                                         target:self
                                       selector:@selector(add_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)add_blockInvoke:(NSTimer *)timer{
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
