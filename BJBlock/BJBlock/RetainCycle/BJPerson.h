//
//  BJPerson.h
//  BJBlock
//
//  Created by zhangwenjun on 16/12/26.
//  Copyright © 2016年 zhangwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^myBlock)();
typedef void (^myBlock2)(NSString *str);

@interface BJPerson : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) myBlock block;
@property (nonatomic, copy) myBlock2 block2;

@end
