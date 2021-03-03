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
