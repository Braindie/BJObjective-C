//
//  Animal.h
//  BJProperty
//
//  Created by zhangwenjun on 2019/2/13.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject{
    NSString *_name;
}

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END



@interface Mammal : Animal {
    NSInteger   _numberOfLegs;
}

- (instancetype)initWithName:(NSString *)name andLegs:(NSInteger)numberOfLegs NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithLegs:(NSInteger)numberOfLegs;

@end


@interface Whale : Mammal {
    BOOL    _canSwim;
}

- (instancetype)initWhale NS_DESIGNATED_INITIALIZER;

@end

