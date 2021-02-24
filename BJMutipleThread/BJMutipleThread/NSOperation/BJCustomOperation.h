//
//  BJCustomOperation.h
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BJloadImageDelegate <NSObject>

- (void)loadImageFinish:(UIImage *)image;

@end

@interface BJCustomOperation : NSOperation
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, weak) id<BJloadImageDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
