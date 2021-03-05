//
//  BJAssociatePerson+Test.h
//  BJOC
//
//  Created by 张文军 on 2021/3/5.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//

/*
     实现关联对象技术的核心对象有
     AssociationsManager
     AssociationsHashMap
     ObjectAssociationMap
     ObjcAssociation
 */

#import "BJAssociatePerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface BJAssociatePerson (Test)

// 只会生成set和get方法的声明，由于没有实例对象而不会实现这俩方法
@property (nonatomic, assign) NSInteger age;

@property (nonatomic, assign) NSInteger weight;

@property (nonatomic, strong) NSString *name;


@end

NS_ASSUME_NONNULL_END
