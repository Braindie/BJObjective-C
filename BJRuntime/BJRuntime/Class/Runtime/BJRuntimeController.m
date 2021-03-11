//
//  BJRuntimeController.m
//  BJRuntime
//
//  Created by 张文军 on 2021/3/10.
//

#import "BJRuntimeController.h"
#import "BJIsaPerson.h"

@interface BJRuntimeController ()

@end

@implementation BJRuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    BJIsaPerson *person = [[BJIsaPerson alloc] init];
//    person.tall = YES;
    person.rich = NO;
    person.handsome = YES;
    
    NSLog(@"tall : %d   rich : %d  handsome : %d", person.isTall, person.isRich, person.isHandsome);
}

@end
