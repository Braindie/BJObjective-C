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

@interface BJIsaPerson () {
    /// 位域
//    struct {
//        char tall : 1;
//        char rich : 1;
//        char handsome : 1;
//    } _tallRichHandsome;
    
    /// 共用体
    union {
        int bits;
        
        struct {
            char tall : 1;
            char rich : 1;
            char handsome : 1;
        };
    } _tallRichHandsome;
}

@end

@implementation BJIsaPerson {
//    char _tallRichHandsome;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        _tallRichHandsome = 0b00000111;
    }
    return self;
}


#pragma mark -
/*
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
 
 */

#pragma mark - 位域
/*
- (void)setTall:(BOOL)tall
{
    _tallRichHandsome.tall = tall;
}

- (BOOL)isTall
{
    return !!_tallRichHandsome.tall;
}

- (void)setRich:(BOOL)rich
{
    _tallRichHandsome.rich = rich;
}

- (BOOL)isRich
{
    return !!_tallRichHandsome.rich;
}

- (void)setHandsome:(BOOL)handsome
{
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)isHandsome
{
    return !!_tallRichHandsome.handsome;
}
*/

#pragma mark - 共用体
- (void)setTall:(BOOL)tall
{
    if (tall) {
        _tallRichHandsome.bits |= MJTallMask;
    } else {
        _tallRichHandsome.bits &= ~MJTallMask;
    }
}

- (BOOL)isTall
{
    return !!(_tallRichHandsome.bits & MJTallMask);
}

- (void)setRich:(BOOL)rich
{
    if (rich) {
        _tallRichHandsome.bits |= MJRichMask;
    } else {
        _tallRichHandsome.bits &= ~MJRichMask;
    }
}

- (BOOL)isRich
{
    return !!(_tallRichHandsome.bits & MJRichMask);
}

- (void)setHandsome:(BOOL)handsome
{
    if (handsome) {
        _tallRichHandsome.bits |= MJHandsomeMask;
    } else {
        _tallRichHandsome.bits &= ~MJHandsomeMask;
    }
}

- (BOOL)isHandsome
{
    return !!(_tallRichHandsome.bits & MJHandsomeMask);
}

@end
