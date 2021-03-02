//
//  BJKVOViewController.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJKVOViewController.h"
#import "BJPerson.h"
#import <objc/runtime.h>

@interface BJKVOViewController ()
@property (nonatomic, strong) BJPerson *person1;
@property (nonatomic, strong) BJPerson *person2;

//@property (nonatomic, copy) NSString *testStr;
@end

@implementation BJKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"KVO";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    self.person1 = [[BJPerson alloc] init];
    self.person1.age = @"18";
    
    self.person2 = [[BJPerson alloc] init];
    self.person2.age = @"18";
    
    NSLog(@"person1-IMP：%p",[self.person1 methodForSelector:@selector(setAge:)]);
//    (BJOC`-[BJPerson setAge:] at BJPerson.h:14)

    
    NSKeyValueObservingOptions option = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:option context:@"测试"];
    
    // NSKVONotifying_Person是使用Runtime动态创建的一个类，是Person的子类
    NSLog(@"person1：%s,person2：%s",object_getClassName(self.person1),object_getClassName(self.person2));
//    person1：NSKVONotifying_BJPerson,person2：BJPerson
    NSLog(@"%@ %@", [self.person1 class], [self.person2 class]);
    
    
    NSLog(@"person1-IMP：%p",[self.person1 methodForSelector:@selector(setAge:)]);
//    (Foundation`_NSSetObjectValueAndNotify)
    
    
    /*
        NSKVONotifying_BJPerson 调用了这些方法
            setAge:,
            class,
            dealloc,
            _isKVOA,
     */
    [self printMethodNamesOfClass:object_getClass(self.person1)];
    [self printMethodNamesOfClass:object_getClass(self.person2)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //由于加了观测者，导致其isa指向了NSKVONotifying_BJPerson
    //po self.person1.isa   ->  NSKVONotifying_BJPerson（是BJPerson的子类）
    self.person1.age = @"20";//对象调用了set方法就会马上触发observeValueForKeyPath
    
    //po self.person2.isa   ->  BJPerson
    self.person2.age = @"20";
    
}

//监听者如果不实现这个方法会崩溃，所以在这个控制器销毁之前要解除监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{

    NSLog(@"\n 被观测对象：%@\n 被观测的属性：%@\n 值的改变: %@\n 携带信息:%@", object, keyPath, change, context);

}

// 验证 NSKVONotifying_BJPerson 重写的方法
- (void)printMethodNamesOfClass:(Class)cls {
    unsigned int count;
    // 获取方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    NSMutableString *methodNames = [NSMutableString string];
    for (NSInteger i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendFormat:@"%@, ",methodName];
    }
    // 释放
    free(methodList);
    
    NSLog(@"%@  %@", cls, methodNames);
}


@end
