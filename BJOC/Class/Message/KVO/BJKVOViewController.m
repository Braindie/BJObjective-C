//
//  BJKVOViewController.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJKVOViewController.h"
#import "BJPerson.h"

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
    
    NSLog(@"person1：%s,person2：%s",object_getClassName(self.person1),object_getClassName(self.person2));
//    person1：NSKVONotifying_BJPerson,person2：BJPerson
    NSLog(@"%@ %@", [self.person1 class], [self.person2 class]);
//    BJPerson BJPerson(和上面打印的类名不同是重写了class方法）苹果并不希望把NSKVONotifying_Person这个类暴露出来，屏蔽内部实现，隐藏这个类的存在。
    

    
    NSLog(@"person1-IMP：%p",[self.person1 methodForSelector:@selector(setAge:)]);
//    (Foundation`_NSSetObjectValueAndNotify)

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


@end
