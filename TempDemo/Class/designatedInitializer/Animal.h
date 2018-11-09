//
//  Animal.h
//  TempDemo
//
//  Created by zhangwenjun on 2018/11/9.
//  Copyright © 2018 zcgt_ios_01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject{
    NSString *_name;
}

- (instancetype)initWithName:(NSString *)name NS_DESIGNATED_INITIALIZER;
    
@end

NS_ASSUME_NONNULL_END
