//
//  BJKVCViewController.m
//  BJOC
//
//  Created by zhangwenjun on 2019/3/15.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

#import "BJKVCViewController.h"
#import "BJStudent.h"
#import "BJPeople.h"
#import "BJObjectOrNot.h"
#import "BJArrayType.h"
#import "BJDictionaryType.h"

@interface BJKVCViewController ()

@end

@implementation BJKVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"KVC";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // KVC——设值、取值
    [self kvcSearchKey];
    
    // KVC与set、get
//    [self kvcValueForKeyPath];
    
    // value必须为对象
//    [self kvcAndObjectOrNot];
    
    // 触发KVO
//    [self kvcAndKVO];
    
    //KVC与字典
//    [self kvcAndDictionary];
    
    //KVC与崩溃
//    [self kvcAndCrash];
//    [self arrAndCrash];
//    [self arrayCrash];
    
}

#pragma mark - KVC——设值、取值
- (void)kvcSearchKey{
    BJStudent *student = [[BJStudent alloc] init];
    [student setValue:@(18) forKey:@"age"];
    
    // 没有name属性，Crash
    [student setValue:@"张三" forKey:@"name"];
    
    NSString *str = [student valueForKey:@"name"];
    NSLog(@"%@",str);
    
}

#pragma mark - KVC与set、get
- (void)kvcValueForKeyPath{
    
    BJPeople *people1 = [BJPeople new];
    BJAddress *ads = [BJAddress new];
    ads.country = @"China";//set方法设值
    people1.address = ads;
    NSString *country1 = people1.address.country;//get方法获取
    NSString *country2 = [people1 valueForKeyPath:@"address.country"];//KVC方式获取
    NSLog(@"country1-%@，country2-%@",country1,country2);
    
    [people1 setValue:@"USA" forKeyPath:@"address.country"];//KVC方式设值
    country1 = people1.address.country;
    country2 = [people1 valueForKeyPath:@"address.country"];
    NSLog(@"country1-%@，country2-%@",country1,country2);
}

#pragma mark - value必须为对象
- (void)kvcAndObjectOrNot{
    BJObjectOrNot *objc = [BJObjectOrNot new];
    [objc setValue:@"zhang" forKey:@"name"];
    
    //设值：value必须封装成对象NSNumber或NSValue
//    [objc setValue:1 forKey:@"age"];
    NSNumber *num = [NSNumber numberWithInt:1];
    [objc setValue:num forKey:@"age"];
    
    //取值：返回的是一个id类型对象，需要手动转换为原来的类型
    NSLog(@"name:%@, age:%@",[objc valueForKey:@"name"],[objc valueForKey:@"age"]);
}

#pragma mark - 触发KVO
- (void)kvcAndKVO{
    //
    BJArrayType *objc = [BJArrayType new];
    
    // instance
    [objc changeInstance];
    
    // 数组
//    [objc addItem];
//    [objc addItemObserver];
//    [objc removeItemObserver];
}

#pragma mark -- Dictionary (setValuesForKeysWithDictionary)
- (void)kvcAndDictionary{
    BJDictionaryType *dicObjc = [BJDictionaryType new];
    dicObjc.country = @"China";
    dicObjc.province = @"He Nan";
    dicObjc.city = @"Zheng Zhou";
    dicObjc.district = @"Dong Qu";
    
    NSArray *arr = @[@"country",@"province",@"city",@"district"];
    
    NSDictionary *dic = [dicObjc dictionaryWithValuesForKeys:arr];//把对应key的所有属性取出来（如果mode没有这个属性，会崩）
    NSLog(@"dic = %@",dic);
    
    
    
    NSDictionary *dict = @{@"country":@"USA",@"province":@"california",@"city":@"Los Angula"};
    NSLog(@"country:%@  province:%@ city:%@",dicObjc.country,dicObjc.province,dicObjc.city);
    //用key value来修改Model的属性（如果mode没有这个属性，会崩）
    [dicObjc setValuesForKeysWithDictionary:dict];
    NSLog(@"country:%@  province:%@ city:%@",dicObjc.country,dicObjc.province,dicObjc.city);
}


#pragma mark - 崩溃
- (void)arrAndCrash {
    NSMutableArray *arr = [NSMutableArray array];
    
    /// 注意，注意，注意：会崩，对比 setObject: forKey: （object cannot be nil）
//    [arr addObject:nil];
    
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@1];
    [array addObject:@2];
    [array addObject:@3];
    [array addObject:@4];
    // 不崩溃
//    [array enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {if (obj.integerValue == 1) {
//            [array removeObject:obj];
//        }
//    }];
    // 崩溃，reason: '*** Collection was mutated while being enumerated.'
    for (NSNumber *obj in array) {
        if (obj.integerValue == 1) {
            [array removeObject:obj];
        }
    }
}

- (void)arrayCrash {
//     for (NSString *str in array) {
//
//         NSLog(@"%@", str);
//         NSLog(@"%@", array);
////        if ([str isEqualToString:@"4"]) {
////        }
//         [array removeObject:str];
//
//         NSLog(@"--%@", str);
//         NSLog(@"--%@", array);
//
//     }
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2",@"3",@"4",@"9",@"4",@"12",@"13", nil];

    for (int i = 0; i < array.count; i++) {
        NSLog(@"==============%d", i);
        NSString *str  = array[i];
        NSLog(@"删除前%@", str);
        NSLog(@"删除前%@", array);

        [array removeObject:str];
        NSLog(@"删除后--%@", str);
        NSLog(@"删除后--%@", array);

     }
}

- (void)kvcAndCrash {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    // key为nil会崩
//    [dic setValue:@"value" forKey:nil];
    
    // key为非对象会崩
//    [dic setValue:@"value" forKey:@(1)];
    
    // value为nil不会崩，但key-value无法写入
//    [dic setValue:nil forKey:@"key"];
    
    
    // 取得时候不会崩
//    NSString *str = [dic objectForKey:@"name"];
//    NSString *str = dic[@"name"];
    
    /// 注意，注意，注意：会崩，推荐用KVC
//    [dic setObject:nil forKey:@"name"];
}

@end
