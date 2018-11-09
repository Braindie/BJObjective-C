//
//  Whale.h
//  TempDemo
//
//  Created by zhangwenjun on 2018/11/9.
//  Copyright © 2018 zcgt_ios_01. All rights reserved.
//

#import "Mammal.h"

NS_ASSUME_NONNULL_BEGIN

@interface Whale : Mammal{
    BOOL _canSwim;
}

- (instancetype)initWhale NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
