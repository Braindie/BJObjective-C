//
//  BJUser.h
//  BJProperty
//
//  Created by zhangwenjun on 17/3/6.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BJSex){
    BJSexMan,
    BJSexWoman
};

//性别最好这样写
typedef NS_ENUM(NSInteger, BJGender) {
    BJGenderUnknow,
    BJGenderMale,
    BJGenderFemale,
    BJGenderNeuter//中性的
};



@interface BJUser : NSObject

@property (nonatomic, assign) BJSex *sex;
@property (nonatomic, assign) BJGender *gender;

@end
