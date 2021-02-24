# BJOC

### 多态
同一个方法作用于不同的类，产生不同的执行效果

### 算法
简单排序

### 代理
week和assign<br/>
野指针的产生没搞完

### KVO
OC中的一个通知机制，定义了一个对象监控对方状态的改变，并做出反应的机制


### KVC
KVC提供了一种间接访问其属性方法或成员变量的机制，可以通过字符串来访问对应的属性方法或成员变量



# 内存管理

## 介绍（包含两个工程）

###
[BJProperty](https://github.com/Braindie/BJMemory/tree/master/BJProperty)

###
[BJBlock]()


## BJProperty工程


### 一、属性关键字

#### strong和copy
- 因为父类指针可以指向子类对象,使用 copy 的目的是为了让本对象的属性不受外界影响,使用 copy 无论给我传入是一个可变对象还是不可对象,我本身持有的就是一个不可变的副本.保护了不可变对象的封装性。
- 如果我们使用是 strong ,那么这个属性就有可能指向一个可变对象,如果这个可变对象在外部被修改了,那么会影响该属性.


#### copy和mutableCopy
非集合类对象的copy和mutableCopy（详见Demo，有很多注释）
```objc
[immutableObject copy] // 浅复制
[immutableObject mutableCopy] //深复制
[mutableObject copy] //深复制
[mutableObject mutableCopy] //深复制
```
集合类对象的copy和mutableCopy
```objc
[immutableObject copy] // 浅复制
[immutableObject mutableCopy] //单层深复制
[mutableObject copy] //单层深复制
[mutableObject mutableCopy] //单层深复制
```

#### 自定义对象支持copy方法
自定义对象可以支持copy方法，我们所需要做的是：自定义对象遵守NSCopying协议，且实现copyWithZone方法。NSCopying协议是系统提供的，直接使用即可。


#### 原子性与非原子性
一般情况下并不要求属性必须是“原子的”，因为这并不能保证“线程安全” ( thread safety)，若要实现“线程安全”的操作，还需采用更为深层的锁定机制才行。例如，一个线程在连续多次读取某属性值的过程中有别的线程在同时改写该值，那么即便将属性声明为 atomic，也还是会读到不同的属性值。

#### @dynamic与@synthesize



### 二、ViewController与View的生命周期

1. UIViewController的生命周期：

pushViewController->popViewControllerAnimated

![ViewController的生命周期](https://github.com/Braindie/BJMemory/blob/master/Images/FC6E411A-D751-4FF6-8D54-D996B568086C.png)

2. View的生命周期
 使用Xib和Code初始化View的区别





### 三、指定初始化函数
OC的子类初始化函数三规范：
1. 子类如果有指定初始化函数，那么指定初始化函数实现时必须调用它的直接父类的指定初始化函数。
2. 子类如果有指定初始化函数，那么便利初始化函数必须调用自己的其它初始化函数(包括指定初始化函数以及其他的便利初始化函数)，不能调用super的初始化函数。
3. 子类如果有指定初始化函数，那么一定要实现所有父类的指定初始化函数。





--- 





## BJBlock工程


### 一、block的三种类型



### 二、__block的使用

__block在堆与栈上的处理

[在block内如何修改block外部变量，为啥？](https://github.com/ChenYilong/iOSInterviewQuestions/blob/master/01%E3%80%8A%E6%8B%9B%E8%81%98%E4%B8%80%E4%B8%AA%E9%9D%A0%E8%B0%B1%E7%9A%84iOS%E3%80%8B%E9%9D%A2%E8%AF%95%E9%A2%98%E5%8F%82%E8%80%83%E7%AD%94%E6%A1%88/%E3%80%8A%E6%8B%9B%E8%81%98%E4%B8%80%E4%B8%AA%E9%9D%A0%E8%B0%B1%E7%9A%84iOS%E3%80%8B%E9%9D%A2%E8%AF%95%E9%A2%98%E5%8F%82%E8%80%83%E7%AD%94%E6%A1%88%EF%BC%88%E4%B8%8B%EF%BC%89.md#38-在block内如何修改block外部变量)

### 三、__weak的使用
```
__weak typeof(self) weakSelf = self;
```

## BJTestBlock工程
使用Clang编译成C++来分析block

