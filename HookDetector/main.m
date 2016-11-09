//
//  main.m
//  HookDetector
//
//  Created by nexa on 06/11/2016.
//  Copyright © 2016 nexa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "demo.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        Method methodTarget =  class_getInstanceMethod([Target class], @selector(printAsString));
//        Method methodHook =  class_getInstanceMethod([Hook class], @selector(newPrintAsString));
//        method_exchangeImplementations(methodTarget, methodHook);
//        Target *target = [Target alloc];
//        [target printAsString];
        
        
        Method methodTargetEx =  class_getInstanceMethod([TargetEx class], @selector(printAsString));
        Method methodHookEx =  class_getInstanceMethod([HookEx class], @selector(printAsString));
        method_exchangeImplementations(methodTargetEx, methodHookEx);
        TargetEx *targetEx = [[TargetEx alloc] init];
        [targetEx printAsString];
    }
    return 0;
}
