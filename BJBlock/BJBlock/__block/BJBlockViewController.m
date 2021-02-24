//
//  BJBlockViewController.m
//  BJBlock
//
//  Created by zhangwenjun on 2019/2/27.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "BJBlockViewController.h"

@interface BJBlockViewController ()

@property (nonatomic, strong) NSArray *persons;

@property (nonatomic, copy) NSString *titleStr;
@end

@implementation BJBlockViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 非对象
//    [self testBasicType];
  
    // 对象
    [self testObjcType];
  
}

- (void)testBasicType{
    // __block的变量被转化成了一个结构体__Block_byref_i_0

//    __block int a = 11;
   int a = 11;

    NSLog(@"%d",a);
    NSLog(@"基本数据类型修改前 a = %p",&a);//指针地址
    NSLog(@"基本数据类型修改前 a = %p",a);//a内存地址在栈区
    
    void (^myBlock)(void) = ^{
//        a++;
        NSLog(@"%d",a);
        NSLog(@"基本数据类型修改后block内 a = %p",&a);//a的指针地址在堆区（改变了）
        NSLog(@"基本数据类型修改后block内 a = %p",a);//b指向堆中的内存地址（改变了）
    };
    NSLog(@"%@",myBlock);
    
    myBlock();

    
    //“定义后”和“block内部”两者的内存地址是一样的，我们都知道 block 内部的变量会被 copy 到堆区，“block内部”打印的是堆地址，因而也就可以知道，“定义后”打印的也是堆的地址。
    NSLog(@"基本数据类型修改后 a = %p",&a);//a的指针地址，和Block中的相同
    NSLog(@"基本数据类型修改后 a = %p",a);//a的内存地址，和Block中的相同
    
  
  //总结（非对象变量）
  //ARC环境下，一旦Block赋值就会触发copy，__block就会copy到堆上，Block也是__NSMallocBlock。（ARC环境下也是存在__NSStackBlock的时候，这种情况下，__block就在栈上。）
    //MRC环境下，只有copy，__block才会被复制到堆上，否则，__block一直都在栈上，block也只是__NSStackBlock，这个时候__forwarding指针就只指向自己了。

    //1、不带__block的变量只能被访问，不能改变值
    //2、带__block的自动变量和静态变量就是直接地址访问，所以在block里面可以直接改变变量的值
  //3、全局变量、静态全局变量、函数参数也可以在block中改变变量的值，但是他们并没有变成block结构体的成员变量，因为他们的作用域大，所以可以直接在block中改变他们的值，注意：他们也不会被block持有
}


- (void)testObjcType{
    
    //ARC环境下，Block捕获外部对象变量，是都会copy一份的，地址都不同。只不过带有__block修饰符的变量会被捕获到Block内部持有。
    __block id block_obj = [[NSObject alloc] init];
    id obj = [[NSObject alloc] init];
    
    NSLog(@"***Block前****block_obj = [%@ , %p] , obj = [%@ , %p]",block_obj , &block_obj , obj , &obj);
    
    void (^myBlock)(void) = ^{
        NSLog(@"***Block中****block_obj = [%@ , %p] , obj = [%@ , %p]",block_obj , &block_obj , obj , &obj);
    };
    
    myBlock();
  
    //总结（对象变量）
  
    //ARC环境下，对于声明为__block的外部对象，在block内部会进行retain，以至于在block环境内能安全的引用外部对象，所以才会产生循环引用的问题！
    //MRC环境下，__block根本不会对指针所指向的对象执行copy操作，而只是把指针进行的复制。
}




- (void)dealloc{
    NSLog(@"有我在，就没有循环引用");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
