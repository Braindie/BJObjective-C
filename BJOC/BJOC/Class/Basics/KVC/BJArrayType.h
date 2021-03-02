//
//  BJArrayType.h
//  BJOC
//
//  Created by zhangwenjun on 2019/3/18.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJArrayType : NSObject{
    NSString *_name;
}

@property (nonatomic, strong) NSMutableArray *array;

- (void)addItem;
- (void)addItemObserver;
- (void)removeItemObserver;

- (void)changeInstance;
@end

NS_ASSUME_NONNULL_END
