//
//  BJClassPerson.m
//  BJRuntime
//
//  Created by 张文军 on 2021/3/11.
//

/*

struct objc_object {
    isa_t isa;
};

struct objc_class : objc_object {
    Class superclass;
    cache_t cache;
    class_data_bits_t bits;
    
    class_rw_t *data() const {
        return bits.data();
    }
}

struct class_rw_t {
    uint32_t flags;
    uint32_t version;
    const class_ro_t *ro;
    method_list_t * methods;    // 方法列表
    property_list_t *properties;    // 属性列表
    const protocol_list_t * protocols;  // 协议列表
    Class firstSubclass;
    Class nextSiblingClass;
    char *demangledName;
};

struct class_ro_t {
    uint32_t flags;
    uint32_t instanceStart;
    uint32_t instanceSize;  // instance对象占用的内存空间
#ifdef __LP64__
    uint32_t reserved;
#endif
    const uint8_t * ivarLayout;
    const char * name;  // 类名
    method_list_t * baseMethodList;
    protocol_list_t * baseProtocols;
    const ivar_list_t * ivars;  // 成员变量列表
    const uint8_t * weakIvarLayout;
    property_list_t *baseProperties;
};

*/



#import "BJClassPerson.h"

@implementation BJClassPerson

- (int)test:(int)age height:(int)height {
    NSLog(@"%s", __func__);
    
    return 0;
}

@end
