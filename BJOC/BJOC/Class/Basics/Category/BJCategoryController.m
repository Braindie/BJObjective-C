//
//  BJCategoryController.m
//  BJOC
//
//  Created by 张文军 on 2021/3/2.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//


/*
struct category_t {
    const char *name;
    classref_t cls;
    WrappedPtr<method_list_t, PtrauthStrip> instanceMethods;
    WrappedPtr<method_list_t, PtrauthStrip> classMethods;
    struct protocol_list_t *protocols;
    struct property_list_t *instanceProperties;
    // Fields below this point are not always present on disk.
    struct property_list_t *_classProperties;

    method_list_t *methodsForMeta(bool isMeta) {
        if (isMeta) return classMethods;
        else return instanceMethods;
    }

    property_list_t *propertiesForMeta(bool isMeta, struct header_info *hi);
    
    protocol_list_t *protocolsForMeta(bool isMeta) {
        if (isMeta) return nullptr;
        else return protocols;
    }
};
 */

#import "BJCategoryController.h"
#import "BJCatePerson.h"
#import "BJCatePerson+Test.h"


#import "BJInitializePerson.h"
#import "BJInitializePerson+Test1.h"
#import "BJInitializePerson+Test2.h"
#import "BJInitializeStudent.h"
#import "BJInitializeStudent+Test1.h"
#import "BJInitializeStudent+Test2.h"
#import "BJInitializeTeacher.h"

@interface BJCategoryController ()

@end

@implementation BJCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    BJCatePerson *person = [[BJCatePerson alloc] init];
//
//    [person test];
    
    [self initializeMethod];
}

- (void)loadMethodOrder {
    /*
     1、+load方法会在runtime加载类、分类时调用
        每个类、分类的+load，在程序运行过程中只调用一次
      
     2、调用顺序
        1.先调用类的+load
            按照编译先后顺序调用（先编译，先调用）
            调用子类的+load之前会先调用父类的+load
        2.再调用分类的+load
            按照编译先后顺序调用（先编译，先调用）
     */
    
    // +load方法是根据方法地址直接调用，并不是经过objc_msgSend函数调用
    
    /*
         objc4源码解读过程：objc-os.mm
         _objc_init
          
         load_images
          
         prepare_load_methods
         schedule_class_load
         add_class_to_loadable_list
         add_category_to_loadable_list
          
         call_load_methods
         call_class_loads
         call_category_loads
         (*load_method)(cls, SEL_load)
     */
}

- (void)initializeMethod {
    
    [BJInitializeStudent alloc];
    
//    [BJInitializePerson alloc];
    
    [BJInitializeTeacher alloc];
    
    
    // 伪代码
//    BOOL sutdentInitialized = NO;
//    BOOL personInitialized = NO;
//    BOOL teacherInitialized = NO;
//
//    [MJStudent alloc];
//
//    if (!sutdentInitialized) {
//        if (!personInitialized) {
//            objc_msgSend([MJPerson class], @selector(initialize));
//            personInitialized = YES;
//        }
//
//        objc_msgSend([MJStudent class], @selector(initialize));
//        sutdentInitialized = YES;
//    }
//
//    [MJTeacher alloc];
//
//    if (!teacherInitialized) {
//        if (!personInitialized) {
//            objc_msgSend([MJPerson class], @selector(initialize));
//            personInitialized = YES;
//        }
//
//        objc_msgSend([MJTeacher class], @selector(initialize));
//        teacherInitialized = YES;
//    }

    
    /*
         先调用父类的+initialize，再调用子类的+initialize
         (先初始化父类，再初始化子类，每个类只会初始化1次)
     
         +initialize和+load的很大区别是，+initialize是通过objc_msgSend进行调用的，所以有以下特点
            1、如果子类没有实现+initialize，会调用父类的+initialize（所以父类的+initialize可能会被调用多次）
            3、如果分类实现了+initialize，就覆盖类本身的+initialize调用
     */
    
    /*
         objc4源码解读过程
         objc-msg-arm64.s（汇编）
         objc_msgSend
          
         objc-runtime-new.mm
         class_getInstanceMethod
         lookUpImpOrNil
         lookUpImpOrForward
         _class_initialize
         callInitialize
         objc_msgSend(cls, SEL_initialize)

     */
    
    /*
         load、initialize方法的区别什么？
         1.调用方式
         1> load是根据函数地址直接调用
         2> initialize是通过objc_msgSend调用

         2.调用时刻
         1> load是runtime加载类、分类的时候调用（只会调用1次）
         2> initialize是类第一次接收到消息的时候调用，每一个类只会initialize一次（父类的initialize方法可能会被调用多次）

         load、initialize的调用顺序？
         1.load
         1> 先调用类的load
         a) 先编译的类，优先调用load
         b) 调用子类的load之前，会先调用父类的load

         2> 再调用分类的load
         a) 先编译的分类，优先调用load

         2.initialize
         1> 先初始化父类
         2> 再初始化子类（可能最终调用的是父类的initialize方法）
     */
    
}

@end
