//
//  BJDelegateView.h
//  BJOC
//
//  Created by zhangwenjun on 2019/3/7.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BJDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BJDelegateViewDelegate <NSObject>

- (void)clickBtnAction;

@end

@interface BJDelegateView : UIView

//在iOS9之前，系统库的delegate和target-action有一部分是assign(unsafe_unretain)的形式，这时候如果内存在别处被回收了，也是会出现野指针的。
//所以iOS9之后这些地方就改成了weak内存修饰符，内存被回收的时候通过weak表，把这些指针设为nil。也大幅度减少了野指针的出现。

@property (nonatomic, assign) id<BJDelegateViewDelegate> delegate;

@property (nonatomic, weak) id<BJDelegate> bjDelegate;

@end

NS_ASSUME_NONNULL_END
