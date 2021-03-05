//
//  BJAssociatePerson+Test.m
//  BJOC
//
//  Created by 张文军 on 2021/3/5.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//

#import "BJAssociatePerson+Test.h"

#import <objc/runtime.h>

@implementation BJAssociatePerson (Test)

- (void)setAge:(NSInteger)age {
    
}

- (NSInteger)age {
    return 0;
}


#pragma mark -
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, @selector(name));
}

- (void)setWeight:(NSInteger)weight {
    objc_setAssociatedObject(self, @selector(weight), @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSInteger)weight {
    // 隐式参数 _cmd = @selector(weight)
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}


#pragma mark -
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, @"name");
//}
//
//- (void)setWeight:(NSInteger)weight {
//    objc_setAssociatedObject(self, @"weight", @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (NSInteger)weight {
//    return [objc_getAssociatedObject(self, @"weight") integerValue];
//}


#pragma mark -
//static const void *BJNameKey = &BJNameKey;
//static const void *BJWeightKey = &BJWeightKey;
//
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, BJNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, BJNameKey);
//}
//
//- (void)setWeight:(NSInteger)weight {
//    objc_setAssociatedObject(self, BJWeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (NSInteger)weight {
//    return [objc_getAssociatedObject(self, BJWeightKey) integerValue];
//}


#pragma mark -
//static const char BJNameKey;
//static const char BJWeightKey;
//
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, &BJNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, &BJNameKey);
//}
//
//- (void)setWeight:(NSInteger)weight {
//    objc_setAssociatedObject(self, &BJWeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (NSInteger)weight {
//    return [objc_getAssociatedObject(self, &BJWeightKey) integerValue];
//}

@end
