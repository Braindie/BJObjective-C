//
//  BJObjectViewController.m
//  BJOC
//
//  Created by 张文军 on 2021/2/23.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//

#import "BJObjectViewController.h"

#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Student : NSObject {
    @public
    int _num;
    int _num2;
}

//@property (nonatomic, assign) int age;// 4字节
//@property (nonatomic, assign) NSInteger age;// 8字节

//@property (nonatomic, assign) NSInteger nom;
//@property (nonatomic, strong) NSArray *arr;// 指针8字节

@end

@implementation Student

@end




@interface BJObjectViewController ()

@end



@implementation BJObjectViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSObject *obj = [[NSObject alloc] init];
    
    // NSObject实例对象的成员变量所占的大小 8
//    NSLog(@"%zd", class_getInstanceSize([NSObject class]));
//    NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
    
    
    
    Student *stu = [[Student alloc] init];
    stu->_num = 1;
//    stu.age = 2;
//    stu.nom = 3;
    
    NSLog(@"%zd", class_getInstanceSize([Student class]));
    NSLog(@"%zd", malloc_size((__bridge const void *)(stu)));
    
    
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
