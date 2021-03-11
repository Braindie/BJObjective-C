//
//  BJRuntimeController.m
//  BJRuntime
//
//  Created by 张文军 on 2021/3/10.
//

#import "BJRuntimeController.h"
#import "BJIsaPerson.h"

/// 无法编译，好像需要真机arm64架构
//#import "MJClassInfo.h"

#import "BJClassPerson.h"

#import "BJMethodPerson.h"

@interface BJRuntimeController ()

@end

@implementation BJRuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testMethod];

}

- (void)testMethod {
    BJMethodPerson *person = [[BJMethodPerson alloc] init];
    
    NSLog(@"%p %p %p", @selector(test), @selector(test), sel_registerName("test"));

    [person test];
    
}

- (void)testClass {
    BJClassPerson *person = [[BJClassPerson alloc] init];
    
    [person test:10 height:20];
}


- (void)testIsa {
    
    BJIsaPerson *person = [[BJIsaPerson alloc] init];
//    person.tall = YES;
    person.rich = NO;
    person.handsome = YES;
    
    NSLog(@"tall : %d   rich : %d  handsome : %d", person.isTall, person.isRich, person.isHandsome);
}

@end
