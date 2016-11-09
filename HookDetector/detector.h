//
//  detector.h
//  HookDetector
//
//  Created by nexa on 06/11/2016.
//  Copyright © 2016 nexa. All rights reserved.
//

#ifndef detector_h
#define detector_h

#import <objc/runtime.h>
#import <objc/message.h>

//void ListMethods(Class cls);
//
//void ListImages();
//
//void ListClassNameForImage(const char* image);
//
//const char* GetImageForClass(Class cls);
//
//void ListMethodForClass(Class cls);
//
//bool isImplementedInClass(IMP imp, Class class);
//
//bool isMethodImplementedInClass(const Method method, const SEL sel, const Class cls);


static inline void report(const char *func, const char *hook_func) {
    NSLog(@"DETECTED: %s hooked by %s", func, hook_func);
}

// 1. check name of selector
static inline void checkSelectorName(const char *func, SEL _cmd) {
    char buf[256] = {'\0'};
    if (strlen(func) > 2) {
        char *start = strstr(func, " ") + 1;
        char *end = strstr(func, "]");
        memcpy(buf, start, sizeof(char) * (end - start));
        const char *sel_name = sel_getName(_cmd);
        if (strcmp(buf, sel_name) != 0) {
            report(buf, sel_name);
        }
    }
}

#define CHECK_IF_METHOD_WAS_HOOKED checkSelectorName(__PRETTY_FUNCTION__, _cmd)

// 2. check IMP
#define DECLARE_OIRGINAL_IMP_DICT(classType) \
static NSMutableDictionary * original ## classType ## IMPDict = nil;

#define STORE_ORIGINAL_IMP(classType) \
original ## classType ## IMPDict = [NSMutableDictionary dictionary]; \
storeClassOriginalIMPs([classType class], original ## classType ## IMPDict);

#define CHECK_IMP(classType) \
checkClassInstanceIMPs([classType class], original ## classType ## IMPDict);

@interface IMPBox : NSObject
{
    @public
    IMP originalIMP;
}

- (id)initWithIMP:(IMP)imp;

@end

static void storeClassOriginalIMPs(Class cls, NSMutableDictionary *originalIMPDict) {
    if (originalIMPDict == nil)
        return;
    
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList(cls, &outCount);
    for (int i = 0;i < outCount;i++) {
        Method method = methods[i];
        SEL sel = method_getName(method);
        const char* selName = sel_getName(sel);
        IMP imp = method_getImplementation(method);
        if (selName) {
//            NSLog(@"    Method: %s", selName);
            [originalIMPDict setValue:[[IMPBox alloc] initWithIMP:imp] forKey:[NSString stringWithFormat:@"%s", selName]];
        }
    }
}

static void checkClassInstanceIMPs(Class cls, NSMutableDictionary *originalIMPDict) {
    if (originalIMPDict == nil)
        return;
    
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList(cls, &outCount);
    for (int i = 0;i < outCount;i++) {
        Method method = methods[i];
        SEL sel = method_getName(method);
        const char* selName = sel_getName(sel);
        IMP imp = method_getImplementation(method);
        if (selName) {
//            NSLog(@"    Method: %s", selName);
            IMPBox *impBox = originalIMPDict[[NSString stringWithFormat:@"%s", selName]];
            if (impBox != nil) {
                if ((int)impBox->originalIMP != (int)imp) {
                    NSLog(@"Hooked: %s", selName);
                }
            }
        }
    }
}

#endif /* detector_h */
