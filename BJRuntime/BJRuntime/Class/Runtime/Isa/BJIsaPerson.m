//
//  BJIsaPerson.m
//  BJRuntime
//
//  Created by 张文军 on 2021/3/10.
//

#import "BJIsaPerson.h"

// 掩码，一般用来按位与(&)运算的
//#define MJTallMask 1
//#define MJRichMask 2
//#define MJHandsomeMask 4

//#define MJTallMask 0b00000001
//#define MJRichMask 0b00000010
//#define MJHandsomeMask 0b00000100

#define MJTallMask (1<<0)
#define MJRichMask (1<<1)
#define MJHandsomeMask (1<<2)

@implementation BJIsaPerson {
    char _tallRichHandsome;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tallRichHandsome = 0b00000111;
    }
    return self;
}



- (void)setTall:(BOOL)tall
{
    if (tall) {
        _tallRichHandsome |= MJTallMask;
    } else {
        _tallRichHandsome &= ~MJTallMask;
    }
}

- (BOOL)isTall
{
    return !!(_tallRichHandsome & MJTallMask);
}

- (void)setRich:(BOOL)rich
{
    if (rich) {
        _tallRichHandsome |= MJRichMask;
    } else {
        _tallRichHandsome &= ~MJRichMask;
    }
}

- (BOOL)isRich
{
    return !!(_tallRichHandsome & MJRichMask);
}

- (void)setHandsome:(BOOL)handsome
{
    if (handsome) {
        _tallRichHandsome |= MJHandsomeMask;
    } else {
        _tallRichHandsome &= ~MJHandsomeMask;
    }
}

- (BOOL)isHandsome
{
    return !!(_tallRichHandsome & MJHandsomeMask);
}


@end
