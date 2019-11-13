//
//  BJRuntimeGrammarViewController.m
//  BJRuntime
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJRuntimeGrammarViewController.h"
#import <objc/runtime.h>

@interface BJRuntimeGrammarViewController ()
@property (nonatomic, copy) NSString *temp;

@property (nonatomic, copy) NSArray *array;

@end

@implementation BJRuntimeGrammarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    //获取类的信息
//    [self class_get];

    //获取成员变量或属性
//    [self class_copy];

    //给动态类添加成员变量或属性
//    [self class_add];

    //方法替换
//    [self class_replace];

}
#pragma runtime - class-get
- (void)class_get{
    //获取类名
    const char *result0 = class_getName([BJRuntimeGrammarViewController class]);
    NSLog(@"类名-----%@",[NSString stringWithUTF8String:result0]);

    //获取父类
    Class result1 = class_getSuperclass([BJRuntimeGrammarViewController class]);
    NSLog(@"父类-----%@",result1);

    //获取实例大小
    size_t result2 = class_getInstanceSize([BJRuntimeGrammarViewController class]);
    NSLog(@"实例大小-----%zu",result2);

    //获取指定的实例变量
    const char *tempChar = [@"_array" UTF8String];
    Ivar result4 = class_getInstanceVariable([BJRuntimeGrammarViewController class], tempChar);
    NSLog(@"实例变量---%@",[NSString stringWithUTF8String:ivar_getName(result4)]);


    //获取指定的属性
    const char *result5 = [@"array" UTF8String];
    objc_property_t result6 = class_getProperty([BJRuntimeGrammarViewController class], result5);
    NSLog(@"属性-----%@",[NSString stringWithUTF8String:property_getName(result6)]);

    NSLog(@"\n");
}

#pragma mark - class-copy
- (void)class_copy{
    //class获取--获取成员变量列表（获取：变量+属性）
    /**
     *  1.获取所有私有变量和属性
     *  2.变量的名和定义的名一样，属性的名前添加了下划线△△△
     */
    unsigned int copyIvarListCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &copyIvarListCount);
    NSLog(@"属性+变量个数-----%d",copyIvarListCount);
    for (NSInteger i = 0; i < copyIvarListCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSLog(@"class_copyIvarList-----%s",name);
    }
    free(ivars);
    NSLog(@"\n");


    //class获取--获取属性列表(获取：属性)
    /**
     *  1.获取所有属性，不包含变量
     *  2.属性名不自动添加下划线△△△
     */
    unsigned int copyPropertyListCount = 0;
    objc_property_t *propertys = class_copyPropertyList([self class], &copyPropertyListCount);
    NSLog(@"属性个数-----%d",copyPropertyListCount);
    for (NSInteger i = 0; i < copyPropertyListCount; i++) {
        objc_property_t property = propertys[i];
        const char *name = property_getName(property);
        NSLog(@"copyPropertyList-----%s",name);
    }
    free(propertys);//释放
    NSLog(@"\n");
    
}

#pragma mark - class-add
- (void)class_add{
    //添加--为动态创建类添加变量
    /**
     * 1.只能给动态创建的类添加变量也就是用 objc_allocateClassPair 创建的类
     * 2.添加变量只能在函数 objc_allocateClassPair 和 class_getInstanceVariable 之间添加才有效
     */
    Class CreatClass0 = objc_allocateClassPair([NSObject class], "CreatClass0", 0);
    class_addIvar(CreatClass0, "attribute0", sizeof(NSString *), log(sizeof(NSString *)), "i");
    Ivar ivar = class_getInstanceVariable(CreatClass0, "attribute0");//获取变量,如果没获取到说明不存在
    NSLog(@"动态添加的变量------%@",[NSString stringWithUTF8String:ivar_getName(ivar)]);
    objc_registerClassPair(CreatClass0);
    NSLog(@"\n");
    
}

#pragma mark - class-replace
- (void)class_replace{
    [self method0];
    BOOL result10 = class_replaceMethod([self class], @selector(method0), (IMP)method1, NULL);
    if (result10) {
        NSLog(@"替换成功");
    }else{
        NSLog(@"替换失败");
    }
    [self method0];
}

-(void)method0{
    NSLog(@"这是原始方法");
}
void method1(){
    NSLog(@"这是替换方法");
}

@end
