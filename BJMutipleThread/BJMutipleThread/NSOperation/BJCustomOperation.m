//
//  BJCustomOperation.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJCustomOperation.h"

@implementation BJCustomOperation

- (void)main{
    if (self.isCancelled) {
        return;
    }
    
    NSURL *url = [NSURL URLWithString:self.imageUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    if (self.isCancelled) {
        url = nil;
        imageData = nil;
        return;
    }
    
    UIImage *image = [UIImage imageWithData:imageData];
    if (self.isCancelled) {
        image = nil;
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(loadImageFinish:)]) {
        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(loadImageFinish:) withObject:image waitUntilDone:NO];
    }
}

@end
