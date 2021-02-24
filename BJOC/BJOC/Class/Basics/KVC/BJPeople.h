//
//  BJPeople.h
//  BJOC
//
//  Created by zhangwenjun on 2019/3/18.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJAddress : NSObject
@property (nonatomic, copy) NSString *country;
@end

@interface BJPeople : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) BJAddress *address;
@property (nonatomic, assign) NSInteger age;
@end

NS_ASSUME_NONNULL_END
