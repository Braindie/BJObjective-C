//
//  BJPerson.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJPerson.h"

@implementation BJPerson

- (void)setAge:(NSString *)age{
    _age = age;
    
    NSLog(@"%s",__func__);//2
}


- (void)willChangeValueForKey:(NSString *)key{
    [super willChangeValueForKey:key];
    
    NSLog(@"%s",__func__);//1
}

- (void)didChangeValueForKey:(NSString *)key{
    
    NSLog(@"didChangeValueForKey---begin");//3
    
    [super didChangeValueForKey:key];//4(observeValueForKeyPath)
    
    NSLog(@"didChangeValueForKey---end");//5

}

@end
