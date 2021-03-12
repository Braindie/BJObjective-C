//
//  BJObjcMsgSendController.m
//  BJRuntime
//
//  Created by 张文军 on 2021/3/12.
//

/*
 1. 消息发送
 2. 动态方法解析
 3. 消息转发
 */

#import "BJObjcMsgSendController.h"

@interface BJObjcMsgSendController ()

@end

@implementation BJObjcMsgSendController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1
    [self objc_msgSendTest];
    
    // 2
}


- (void)objc_msgSendTest {
    
//    objc_msgSend(person, sel_registerName("personTest"));

//    sel_registerName() = @selector()
    
    // objc_msgSend(person, @selector(personTest));
    // 消息接收者（receiver）：person
    // 消息名称：personTest
    
    // OC的方法调用：消息机制，给方法调用者发送消息
    // objc_msgSend如果找不到合适的方法进行调用，会报错unrecognized selector sent to instance
}















- (void)selfAndSuper {
    /**
     *   self与supper
     */
//    Son *son = [[Son alloc] init];
//    NSLog(@"%@",[son personGetString]);

    /**
     *   向nil发送消息
     */
//    BJPerson *person = nil;
//    NSLog(@"%@",[person personGetString]);
    
    
    
    
    /*
     
     
     NSLog(@"%@",NSStringFromClass([self class]));
     NSLog(@"%@",NSStringFromClass([super class]));// 误认为[super class]是调用的[super_class class]。
     //打印结果都为Son
     
     
     1、当调用［self class]时，实际先调用的是 objc_msgSend函数，
     2、第一个参数是Son当前的这个实例，然后在Son这个类里面去找 - (Class)class这个方法，没有，
     3、去父类 Father里找，也没有，
     4、最后在 NSObject类中发现这个方法。而 - (Class)class的实现就是返回self的类别，故上述输出结果为 Son。
     
     
     1、当调用 [super class]时，会转换成objc_msgSendSuper函数。
     2、第一步先构造 objc_super 结构体，结构体第一个成员就是self 。 第二个成员是 (id)class_getSuperclass(objc_getClass(“Son”)) , 实际该函数输出结果为 Father。
     3、第二步是去 Father这个类里去找 - (Class)class，没有，
     4、然后去NSObject类去找，找到了。
     5、最后内部是使用 objc_msgSend(objc_super->receiver, @selector(class))去调用，（接收消息的对象还是self）
     6、此时已经和[self class]调用相同了，故上述输出结果仍然返回 Son。
     或
     super 的含义，消息转发会调用 objc_msgSendSuper， 就是 去父类的方法列表中找到 initWithFrame:这个方法，然后调用，调用的主体是 self。super 只是一个编译器的特殊字符，并不代表父类的一个实例化对象。
     
     */
}


/**
 *   测试消息转发（其他地方要使用）
 */
- (void)foo{
    NSLog(@"dynamic add new method in runtime");
}
@end
