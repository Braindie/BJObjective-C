//
//  main.m
//  BJRuntimeMethod
//
//  Created by 张文军 on 2021/3/12.
//

#import <Foundation/Foundation.h>
#import "MJClassInfo.h"
#import "BJMethodStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BJMethodStudent *student = [[BJMethodStudent alloc] init];
        mj_objc_class *studentClass = (__bridge mj_objc_class *)[BJMethodStudent class];
        
        [student personTest];
        [student studentTest];
        [student personTest];
        [student studentTest];
        NSLog(@"--------");
        
        
        /// 打印缓存中的方法
        cache_t cache = studentClass->cache;
        
        bucket_t *buckets = cache._buckets;
        bucket_t bucket = buckets[(long long)@selector(test) & cache._mask];
        NSLog(@"%s %p", bucket._key, bucket._imp);
        
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%s %p", bucket._key, bucket._imp);
        }
        
        NSLog(@"------");
        
        NSLog(@"%s %p", @selector(personTest), cache.imp(@selector(personTest)));
        NSLog(@"%s %p", @selector(studentTest), cache.imp(@selector(studentTest)));
        
        NSLog(@"------");


    }
    return 0;
}
