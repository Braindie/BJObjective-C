//
//  BJStudent.h
//  BJProperty
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJStudent : NSObject<NSCopying>{
    NSString *_sex;
}

@property (atomic, copy) NSString *name;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, assign) int age;

- (instancetype)initWithName:(NSString *)name age:(int)age sex:(NSString *)sex;
@end

NS_ASSUME_NONNULL_END
