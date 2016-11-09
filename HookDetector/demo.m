//
//  demo.m
//  HookDetector
//
//  Created by nexa on 06/11/2016.
//  Copyright © 2016 nexa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "demo.h"
#import "detector.h"

// 1
@implementation Target

- (void)printAsString {
    CHECK_IF_METHOD_WAS_HOOKED;
    
    NSLog(@"Target!");
}

@end

@implementation Hook

- (void)printAsString {
    CHECK_IF_METHOD_WAS_HOOKED;
    
    NSLog(@"Hook!");
}

- (void)newPrintAsString {
    CHECK_IF_METHOD_WAS_HOOKED;

    NSLog(@"New Hooking!");
}

@end

// 2
DECLARE_OIRGINAL_IMP_DICT(TargetEx);
@implementation TargetEx

+ (void) load {
    STORE_ORIGINAL_IMP(TargetEx);
}

- (id)init {
    CHECK_IMP(TargetEx);
    return self;
}

- (void)printAsString {
    CHECK_IMP(TargetEx);
    NSLog(@"Target!");
}

@end

@implementation HookEx

- (void)printAsString {
    NSLog(@"HookEx!");
}

@end


