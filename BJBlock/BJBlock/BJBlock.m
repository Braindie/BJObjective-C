//
//  BJBlock.m
//  BJBlock
//
//  Created by 张文军 on 2021/3/5.
//  Copyright © 2021 zhangwenjun. All rights reserved.
//

#import "BJBlock.h"

@implementation BJBlock

- (void)test {
    void (^block)() = ^{
        NSLog(@"this is a %@", _name);
    };
    block();
}

/*
struct __BJBlock__test_block_impl_0 {
  struct __block_impl impl;
  struct __BJBlock__test_block_desc_0* Desc;
  BJBlock *self;
  __BJBlock__test_block_impl_0(void *fp, struct __BJBlock__test_block_desc_0 *desc, BJBlock *_self, int flags=0) : self(_self) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
 */

@end
