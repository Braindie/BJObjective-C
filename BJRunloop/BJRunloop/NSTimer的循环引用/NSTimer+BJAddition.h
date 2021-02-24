//
//  NSTimer+BJAddition.h
//  BJRunloop
//
//  Created by zhangwenjun on 2019/3/7.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (BJAddition)

+ (NSTimer *)addScheduledTimerWithTimeInterval:(NSTimeInterval)time
                                       repeats:(BOOL)repeats
                                         block:(void(^)(void))block;
@end

NS_ASSUME_NONNULL_END
