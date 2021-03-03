//
//  BJCategoryController.m
//  BJOC
//
//  Created by 张文军 on 2021/3/2.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//

#import "BJCategoryController.h"
#import "BJCatePerson.h"
#import "BJCatePerson+Test.h"

@interface BJCategoryController ()

@end

@implementation BJCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BJCatePerson *person = [[BJCatePerson alloc] init];
    
    [person test];
    
}

- (void)loadMethod {
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

@end
