//
//  BJPropertyViewController.m
//  BJProperty
//
//  Created by zhangwenjun on 17/3/2.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import "BJPropertyViewController.h"
#import "BJStudent.h"


@interface BJPropertyViewController (){
    NSString *_firstNamee;//实例变量（如果用@dynamic修饰，必须定义一个实例变量）(如果用@synthesize修饰，会自动生成这个实例变量）
}
/**
    属性（@dynamic与@synthesize）
 */
@property (nonatomic, strong) NSString *firstName;


/**
 *   使用copy修饰的数组 和 使用strong修饰的数组
 */
@property (nonatomic, copy) NSArray *useCopyArray;//一般写法
@property (nonatomic, strong) NSArray *useStrongArray;


/**
 *  使用copy修饰NSMutableArray（这种写法有问题）,所以使用strong修饰NSMutableArray
 */
@property (nonatomic, copy) NSMutableArray *useCopyMutableArray;//copy就是复制一个不可变 NSArray 的对象，所以这种写法有问题
//@property (nonatomic, mutablecopy) NSMutableArray *mutableArray; // mutablecopy不是关键字
@property (nonatomic, strong) NSMutableArray *useStrongMutableArray;//一般写法



/**
    原子性与非原子性（atomic）
 */
@property (atomic, copy) NSArray *acArray;

@end


@implementation BJPropertyViewController

@dynamic firstName;
//@synthesize firstName = _firstNamee;


#pragma mark -
- (void)viewDidLoad {
  
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor grayColor];
  
  
  // 指针与内存地址
  //  [self pointerAndMemory];
  
  
  //使用copy和strong的区别
  //  [self testCopyAndStrong];
  
  //copy修饰可变数组的问题
  //  [self testMutableArrayUseCopy];
  
  //非集合类对象的copy与mutableCopy
  //  [self testIMmutableObjc];
  
  //集合类对象的copy与mutableCopy
  //  [self testMutableObjc];
  
  //自定义对象实现copy
  //  [self testCustumObjcCopy];
  
  
  //dynamic测试
  //  [self testSynamic];
  
  
  //原子性测试
  [self testAtomic];
  
}



#pragma mark - 1、原子性 atomic与nonatomic
- (void)testAtomic{
  
  /*
   原子性与非原子性
   */
  //     acArray
  //     一般情况下并不要求属性必须是“原子的”，因为这并不能保证“线程安全” ( thread safety)，若要实现“线程安全”的操作，还需采用更为深层的锁定机制才行。例如，一个线程在连续多次读取某属性值的过程中有别的线程在同时改写该值，那么即便将属性声明为 atomic，也还是会读到不同的属性值。
  
}


#pragma mark - 2、读写权限 @dynamic 与 @synthesize
- (NSString *)firstName{
    return _firstNamee;
}

- (void)setFirstName:(NSString *)firstName{
    _firstNamee = firstName;
}

- (void)testSynamic{
  
  //当 firstName 用@dynamic修饰之后，如果不实现 setter 方法，会报错”unrecognized selector sent to instance“
  self.firstName = @"@dynamic";
  //当 firstName 用@dynamic修饰之后，如果不实现 getter 方法，会报错”unrecognized selector sent to instance“
  NSLog(@"%@",self.firstName);
  
  
  //假如一个属性被声明为 @dynamic var，然后你没有提供 @setter方法和 @getter 方法，编译的时候没问题，但是当程序运行到 instance.var = someVar，由于缺 setter 方法会导致程序崩溃；或者当运行到 someVar = var 时，由于缺 getter 方法同样会导致崩溃。编译时没问题，运行时才执行相应的方法，这就是所谓的动态绑定。
}


#pragma mark - 3、内存管理语义

#pragma mark 指针与内存地址
- (void)pointerAndMemory {
  
  //犯错点
  //理解：将@"newStirng"当做一个新的对象，将这个对象的内存地址赋值给str。
  NSString *str = @"string";
  NSLog(@"str---%p",&str);//对象的指针的地址
  //0x7ffee721f3b8
  //(__NSCFConstantString *) $0 = 0x00000001089e3280 @"string"
  
  str = @"newString";
  NSLog(@"str---%p",&str);//对象的指针的地址
  //0x7ffee721f3b8
  //(__NSCFConstantString *) $1 = 0x00000001089e32c0 @"newString"
  
  
  //p &str 则打印的是引用对象的指针地址
  //p str 会打印对象本身的内存地址和对象内容
}

#pragma mark copy与strong
- (void)testCopyAndStrong{
    
  NSArray *array = @[ @1, @2, @3, @4 ];
  NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
  
  /**
   *   copy与strong属性修饰符
   */
//  // 使用copy修饰的数组，当原数组清空的时候，本数组不改变
//  self.useCopyArray = mutableArray;
//  // 使用strong修饰的数组，当原数组清空的时候，本数组也清空
//  self.useStrongArray = mutableArray;
//  [mutableArray removeAllObjects];;
  
  /**
   *   copy
   */
//  self.useCopyArray = [mutableArray copy];
//  [mutableArray removeAllObjects];
//  //mutableArray肯定为空
//  NSLog(@"mutableArray===%@",mutableArray);
//  //self.useCopyArray不为空
//  NSLog(@"self.useCopyArray===%@",self.useCopyArray);
  
  /**
   *   strong
   */
  self.useStrongArray = [mutableArray copy];
  [mutableArray removeAllObjects];
  //可变数组copy给一个strong修饰的数组时，由于使用过了copy，当修改可变数组时，strong数组不会被修改
  //mutableArray肯定为空
  NSLog(@"mutableArray===%@",mutableArray);
  //self.useCopyArray不为空
  NSLog(@"self.useStrongArray===%@",self.useStrongArray);
  
}

#pragma mark copy修饰NSMutableArray
- (void)testMutableArrayUseCopy{
  
  /*
   注意
   */
  //    https://www.zybuluo.com/MicroCai/note/50592
  
  /*
   copy和mutableCopy的区别或准则：
   1、copy返回不可变对象。所以，如果对copy返回值使用mutable对象接收就会crash；
   2、mutableCopy返回可变对象。
   */

  
  /*
      copy不能修饰可变数组的问题
   */
  // 因为 copy 就是复制一个不可变 NSArray 的对象,所以会发生崩溃
  //（-[__NSArrayI removeObjectAtIndex:]: unrecognized selector sent to instance 0x60000175cd20）
  NSMutableArray *marray = [NSMutableArray arrayWithObjects:@1,@2,nil];

  self.useCopyMutableArray = marray;
  [self.useCopyMutableArray removeObjectAtIndex:0];
  
  // 所以使用 strong 修饰可变数组
//  self.useStrongMutableArray = marray;
//  [self.useStrongMutableArray removeObjectAtIndex:0]; // (useStrongMutableArray 与 marray都会改变)
}

#pragma mark 非集合类对象的copy与mutableCopy
- (void)testIMmutableObjc{
  
  
  /*
   1、浅复制：不拷贝对象本身，仅拷贝指向对象的指针（即:指针拷贝）
   2、深复制：直接拷贝整个对象的内存到另一块内存中（即：内容拷贝）
   */
    
  /*
   非集合类对象（NSString和NSMutableString）的copy和mutableCopy
   
   [immutableObject copy] // 浅复制(不可变对象本来就不可改变，所以copy后淺复制就行了，不用要Demo，理解就好）如下：stringCopy
   [immutableObject mutableCopy] //深复制（好像没有啥实际用处）如下：mstringmCopy
   [mutableObject copy] //深复制（可变对象使用copy和使用strong是有差别的，详情见上）如下：mstringCopy
   [mutableObject mutableCopy] //深复制（）如下：mstringMCopy
   */
  
  
  /**
   *   不可变字符串（p str 会打印对象本身的内存地址和对象内容）
   */
   NSString *string = @"String";
   NSLog(@"string---%p",&string);//对象的指针的地址
  //0x7ffee44e3378
  //(__NSCFConstantString *) $0 = 0x000000010b71f300 @"String"


  //!< copy
   NSString *stringCopy = [string copy];//对象的指针地址变了,内存地址没变---》浅复制
   NSLog(@"stringCopy---%p",&stringCopy);
  //0x7ffee44e3370
  //(__NSCFConstantString *) $1 = 0x000000010b71f300 @"String"


  //!< mutableCopy
   NSMutableString *mstringmCopy = [string mutableCopy];//对象的指针地址、内存地址都变了---》深复制
   NSLog(@"mstringmCopy---%p",&mstringmCopy);
  //0x7ffee44e3368
  //(__NSCFString *) $2 = 0x000060000034d620 @"Stringmm"
   [mstringmCopy appendString:@"mm"]; //没有崩溃，俩地址都没变
   NSLog(@"mstringmCopy---%p",&mstringmCopy);
  //0x7ffee44e3368
  //(__NSCFString *) $3 = 0x000060000034d620 @"Stringmm"

    
    
  /**
   *   可变字符串
   */
   NSMutableString *mstring = [NSMutableString stringWithFormat:@"MutableString"];
   NSLog(@"mstring---%p",&mstring);
  //0x7ffee95a5360
  //(__NSCFString *) $0 = 0x0000600001ad5770 @"MutableString"

  
  //!< copy
   NSString *mstringCopy = [mstring copy];//对象的指针地址、内存地址都变了---》深复制
   NSLog(@"mstringCopy---%p",&mstringCopy);
  //0x7ffee95a5358
  //(__NSCFString *) $1 = 0x0000600001ad7e70 @"Stringmm"

  // 注意：
   NSMutableString *mmStringCopy = [mstring copy];
   NSLog(@"mmStringCopy---%p",&mmStringCopy);
  //0x7ffee95a5350
  //(__NSCFString *) $2 = 0x00006000014d3100 @"MutableString"
  //注意，由于使用了copy，mmStringCopy是一个immutableObject，下面注释的代码会崩溃，，即copy返回imutable对象
  //[mmStringCopy appendString:@"mm"]; //crash

  
  //!< mutableCopy
   NSMutableString *mstringMCopy = [mstring mutableCopy];//对象的指针地址、内存地址都变了---》深复制
   NSLog(@"mstringMCopy---%p",&mstringMCopy);
    
    
}

#pragma mark 集合类对象的copy与mutableCopy

- (void)testMutableObjc{
    
    
    /*
     集合类对象的copy和mutableCopy
     
     [immutableObject copy] // 浅复制(不可变对象本来就不可改变，所以copy后淺复制就行了）如下：copyArray
     [immutableObject mutableCopy] //单层深复制（）如下：mCopyArray
     [mutableObject copy] //单层深复制（）如下：copyArray
     [mutableObject mutableCopy] //单层深复制（）如下：mCopymArray
     */
    
    /**
     *   不可变对象的copy和mutableCopy
     */
     NSArray *array = @[@[@"a", @"b"], @[@"c", @"d"]];
     NSLog(@"%p",&array);
    //0x7ffee27aa340
    //(__NSArrayI *) $0 = 0x0000600002cf4de0 @"2 elements"

  
    //!< copy
     NSArray *copyArray = [array copy];//copyArray的指针发生了变化，内存地址没有发生变化---》浅复制
     NSLog(@"%p",&copyArray);
    //0x7ffee27aa338
    //(__NSArrayI *) $1 = 0x0000600002cf4de0 @"2 elements"
  
  
    //!< mutableCopy
     NSMutableArray *mCopyArray = [array mutableCopy];//mCopyArray的指针发生了变化，内存地址也发生了变化---》深复制
     NSLog(@"%p",&mCopyArray);
    //0x7ffee27aa330
    //(__NSArrayM *) $2 = 0x00006000022f8d50 @"2 elements"
    
    
    
    
     //可变对象的copy和mutableCopy
     NSMutableArray *marray = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"a"],@"b",@"c",nil];
     NSLog(@"%p",&marray);
    //0x7ffee5b9d328
    //(__NSArrayM *) $0 = 0x0000600000197210 @"3 elements"

  
    //!< copy
     NSArray *copyArr = [marray copy];//copyArray的指针地址和内存地址都发生了变化---》深复制
     NSLog(@"%p",&copyArr);
    //0x7ffee5b9d320
    //(__NSArrayI *) $1 = 0x0000600000197090 @"3 elements"

  
    //!< mutableCopy
     NSMutableArray *mCopymArray = [marray mutableCopy];//mCopyArray的指针地址和内存地址都发生了变化---》深复制
     NSLog(@"%p",&mCopymArray);
    //0x7ffee5b9d318
    //(__NSArrayM *) $2 = 0x000060000018c630 @"3 elements"

}

#pragma mark 自定义的类具有copy属性
- (void)testCustumObjcCopy{
  BJStudent *stu1 = [[BJStudent alloc] initWithName:@"BJ" age:27 sex:@"男"];
  BJStudent *stu2 = [stu1 copy];
  //    BJStudent *stu2 = stu1;
  
  NSLog(@"stu1 = %p stu2 = %p",stu1,stu2);
  
}




@end
