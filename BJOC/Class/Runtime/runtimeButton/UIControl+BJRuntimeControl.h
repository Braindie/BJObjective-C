//
//  UIControl+BJRuntimeControl.h
//  BJRuntime
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (BJRuntimeControl)
/**
 *   再次点击的间隔时间
 */
@property (nonatomic, assign) NSTimeInterval bj_acceptEventInterval;
@end

NS_ASSUME_NONNULL_END
