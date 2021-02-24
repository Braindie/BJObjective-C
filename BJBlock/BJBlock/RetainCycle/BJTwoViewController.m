//
//  BJTwoViewController.m
//  BJBlock
//
//  Created by zhangwenjun on 16/12/26.
//  Copyright © 2016年 zhangwenjun. All rights reserved.
//

#import "BJTwoViewController.h"
#import "BJPerson.h"


//参考http://blog.csdn.net/liu537192/article/details/44708817


@interface BJTwoViewController ()

@property (nonatomic, strong) NSArray *persons;

@property (nonatomic, copy) NSString *titleStr;

@property (nonatomic, copy) void (^block)(void);

@end

@implementation BJTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.titleStr = @"Hello";

  
  //没有循环引用问题
//  [self testRetainCricle1];
  
  //循环引用问题
//    [self testRetainCricle2];
  
  
    //block循环引用的形参解决法
    [self testRetainCricle3];
  
    //block循环引用的__block解决法
//    [self testRetainCricle4];
//    [self testRetainCricle5];
    
    //block循环引用的__weak解决法
//    [self testRetainCricle10];
//    [self testRetainCricle11];
//    [self testRetainCricle12];
    
    
    //三种方法打破循环引用
    //1、在block中手动释放对象
    //2、直接释放block
    //3、使用weakSelf、strongSelf

}

#pragma mark - 没有循环引用
- (void)testRetainCricle1{
    BJPerson *person1 = [[BJPerson alloc] init];
    person1.name = @"张三";
    person1.block = ^{
        NSLog(@"%@",self.titleStr);
    };
  person1.block();
}


#pragma mark - 循环引用问题
- (void)testRetainCricle2{
  
  BJPerson *person2 = [[BJPerson alloc] init];//2、数组中的person2指向了BJPerson
  person2.name = @"李四";
  
  
  person2.block = ^{//3、BJPerson中有个block
    NSLog(@"block进");
    
    NSLog(@"%@",self.titleStr);//4、block中的self指向了VC，导致循环引用
    
    //        self.titleStr = @"Hello World";//4、block中的self指向了VC，导致循环引用
    //        selfVC.titleStr = @"World";//4、解决方法
    
    NSLog(@"block出");
  };
  
  self.persons = @[person2];//1、VC中的persons指向了数组
  
  person2.block();
}

#pragma mark - 循环引用解决1

- (void)testRetainCricle3{
    
    //不会出现循环引用
    BJPerson *person3 = [[BJPerson alloc] init];
    person3.name = @"张三";
    
    person3.block2 = ^(NSString *str) {
        NSLog(@"%@",str);
    };
    
    person3.block2(self.titleStr);
    //原因是person3是作为形参传进block中，block并不会捕获形参到block内部进行持有，所以肯定不会有循环引用
}


#pragma mark - 循环引用解决2

- (void)testRetainCricle4{
    //会有循环引用
    //由于没有执行person这个block，现在person持有该block，block持有__block变量，__block变量又持有person对象。3者形成了环，导致了循环引用了。想打破环就需要破坏掉其中一个引用。
    __block BJPerson *person = [[BJPerson alloc] init];
    person.name = @"BJ";
    person.block = ^{
        NSLog(@"%@",person.name);
        person = nil;
    };
}


- (void)testRetainCricle5{
    
    __block BJPerson *person = [[BJPerson alloc] init];
    person.name = @"BJ";
    person.block = ^{
        NSLog(@"%@",person.name);
        person = nil;
    };
    
    //执行一下block就没循环引用了（注意person = nil）
    person.block();
}


#pragma mark - 循环引用解决3

- (void)testRetainCricle10{
  
  //第一种写法
  //    __unsafe_unretained BJTwoViewController *selfVC = self;
  //第二种写法
  //    __unsafe_unretained typeof(self) selfVC = self;
  //第三种写法
  //    __weak BJTwoViewController *selfVC = self;
  //第四种写法
  //    __weak typeof(self) selfVC = self;
  
  
    BJPerson *person1 = [[BJPerson alloc] init];
    person1.name = @"张三";
    //使用weak解决
    __weak typeof(person1) weakPerson1 = person1;
    
    person1.block = ^{
        NSLog(@"%@",weakPerson1.name);
    };
    
    person1.block();
}


- (void)testRetainCricle11{
    BJPerson *person1 = [[BJPerson alloc] init];
    person1.name = @"张三";
    //使用weak解决
    __weak typeof(person1) weakPerson1 = person1;
    
    person1.block = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@",weakPerson1.name);
            
            //输出的是nill
            //重点就在dispatch_after这个函数里面。在block()的block结束之后，person1被自动释放了。又由于dispatch_after里面捕获的__weak的person1，根据__weak的实现原理，在原对象释放之后，__weak对象就会变成null，防止野指针。所以就输出了null了
            

        });
    };
    
    person1.block();
    
}

- (void)testRetainCricle12{
    BJPerson *person1 = [[BJPerson alloc] init];
    person1.name = @"张三";
    //使用weak解决
    __weak typeof(person1) weakPerson1 = person1;
    
    person1.block = ^{
        __strong typeof(person1) strongPerson1 = weakPerson1;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"%@",strongPerson1.name);
        });
    };
    
    person1.block();
    
}





- (void)dealloc{
    NSLog(@"有我在，就没有循环引用");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
