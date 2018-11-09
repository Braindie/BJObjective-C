//
//  Mammal.h
//  TempDemo
//
//  Created by zhangwenjun on 2018/11/9.
//  Copyright © 2018 zcgt_ios_01. All rights reserved.
//

#import "Animal.h"

NS_ASSUME_NONNULL_BEGIN

@interface Mammal : Animal{
    NSInteger   _numberOfLegs;
}

- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger)numberOfLegs NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithLegs:(NSInteger)numberOfLegs;
@end

NS_ASSUME_NONNULL_END
