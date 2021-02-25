//
//  BJObjectViewController.m
//  BJOC
//
//  Created by 张文军 on 2021/2/23.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//

#import "BJObjectViewController.h"

#import <objc/runtime.h>
#import <malloc/malloc.h>

// NSObject Implementation
struct NSObject_IMPL {
    Class isa; // 8个字节
};

@interface Student : NSObject {
    @public
    int _num;// 内存对齐：结构体的大小必须是最大成员大小的倍数
//    int _num2;
}

//@property (nonatomic, assign) int age;// 4字节
@property (nonatomic, assign) NSInteger age;// 8字节

//@property (nonatomic, assign) NSInteger nom;
//@property (nonatomic, strong) NSArray *arr;// 指针8字节

@end

@implementation Student

@end




@interface BJObjectViewController ()

@end


@implementation BJObjectViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self object_type];
}

- (void)object_memory {
    
//    NSObject *obj = [[NSObject alloc] init];
    
    // NSObject实例对象的成员变量所占的大小 8
//    NSLog(@"%zd", class_getInstanceSize([NSObject class]));
    
    // 分配内存对齐 Buckets
    //#define NANO_MAX_SIZE            256 /* Buckets sized {16, 32, 48, ..., 256} */

    // obj指针所指向内存的大小 16
//    NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
    
    
    Student *stu = [[Student alloc] init];
//    stu->_num = 1;
    stu.age = 2;
//    stu.nom = 3;
    
    
//    NSLog(@"%zd", sizeof(int));
//    NSLog(@"%zd", sizeof(NSInteger));
//    NSLog(@"%zd", sizeof([NSArray class]));
    
    NSLog(@"%zd", class_getInstanceSize([Student class]));
    NSLog(@"%zd", malloc_size((__bridge const void *)(stu)));
}


- (void)object_type {
    
    // 三种对象
    
    // instance对象，实例对象
    NSObject *object1 = [[NSObject alloc] init];
    NSObject *object2 = [[NSObject alloc] init];
    
    // class对象，类对象
    Class objectClass1 = [object1 class];// class方法返回的一直是类对象
    Class objectClass2 = [object2 class];
    
    Class objectClass3 = object_getClass(object1);
    Class objectClass4 = object_getClass(object2);
    
    Class objectClass6 = objc_getClass([@"NSObject" UTF8String]);
    
    Class objectClass5 = [NSObject class];
    
    // meta-class对象，元类对象
    Class objectMetaClass = object_getClass(objectClass5);// 将类对象当做参数，获得元类对象
    
    NSLog(@"instance - %p %p",
          object1,
          object2);
    
    NSLog(@"class - %p %p %p %p %p %p %d",
          objectClass1,
          objectClass2,
          objectClass3,
          objectClass4,
          objectClass5,
          objectClass6,
          class_isMetaClass(objectClass3));
    
    NSLog(@"objectMetaClass - %p %d", objectMetaClass, class_isMetaClass(objectMetaClass));
    
    
    /*
     
     1. Class objc_getClass(const char * _Nonnull name)
        传入的是字符串类名，返回对应的类对象
     
     2. Class object_getClass(id _Nullable obj)
        传入instance对象，返回class对象
        传入class对象，返回mate-class对象
        传入mate-class对象，返回NSObject（基类）的mate-class对象
     
     */
    
    
    /*
     
     返回的都是类对象
     
     - (Class) {
        return self->isa;
     }
     
     + (Class) {
        return self;
     }
     
     */

}

@end
