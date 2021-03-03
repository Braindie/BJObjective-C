//
//  BJCatePerson+Test.m
//  BJOC
//
//  Created by 张文军 on 2021/3/3.
//  Copyright © 2021 zcgt_ios_01. All rights reserved.
//

#import "BJCatePerson+Test.h"

@implementation BJCatePerson (Test)

- (void)test {
    // 优先调用分类的方法，原因见源码
    /*
     源码解读顺序
     ● objc-os.mm
     •_objc_init
     •map_images
     •map_images_nolock
      
     ● objc-runtime-new.mm
     •_read_images
     •remethodizeClass
     •attachCategories
     •attachLists
     •realloc、memmove、 memcpy
     */
    NSLog(@"BJCatePerson (Test) - test");
}

@end
