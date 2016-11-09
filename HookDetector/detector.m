////
////  detector.m
////  HookDetector
////
////  Created by nexa on 06/11/2016.
////  Copyright © 2016 nexa. All rights reserved.
////
//
#import <Foundation/Foundation.h>

#import "detector.h"

@implementation IMPBox

- (id)initWithIMP:(IMP)imp {
    originalIMP = imp;
    return self;
}

@end


//
//void ListMethods(Class cls) {
//    unsigned int outCount = 0;
//    
//    Method *methods = class_copyMethodList(cls, &outCount);
//    
//    for (int i = 0;i < outCount;i++) {
//        Method method = methods[i];
//        SEL methodSEL = method_getName(method);
//        const char* selName = sel_getName(methodSEL);
//        if (selName) {
//            NSLog(@"    Method: %s", selName);
//        }
//    }
//}
//
//void ListImages() {
//    unsigned int outCount = 0;
//    
//    const char** images = objc_copyImageNames(&outCount);
//    
//    for (int i = 0; i < outCount; i++) {
//        const char* image = images[i];
//        if (image) {
//            NSLog(@"    Image: %s", image);
//        }
//    }
//}
//
//void ListClassNameForImage(const char* image) {
//    unsigned int outCount = 0;
//    
//    const char** classes = objc_copyClassNamesForImage(image, &outCount);
//    
//    for (int i = 0; i < outCount; i++) {
//        const char* class = classes[i];
//        NSLog(@"    Class: %s", class);
//    }
//}
//
//const char* GetImageForClass(Class cls) {
//    const char* image = class_getImageName(cls);
//    return image;
//}
//
//bool isImplementedInClass(const IMP imp, Class cls) {
//    unsigned int outCount = 0;
//    
//    Method* methods = class_copyMethodList(cls, &outCount);
//    
//    for (int i = 0;i < outCount;i++) {
//        Method method = methods[i];
//        const IMP impTemp = method_getImplementation(method);
//        if (impTemp == imp)
//            return true;
//    }
//    
//    return false;
//}
//
//bool isIMPImplementedInClass(const IMP imp, const SEL sel, const Class cls) {
//    const Method method = class_getInstanceMethod(cls, sel);
//    if (method != nil) {
//        const IMP impTemp = method_getImplementation(method);
//        if (impTemp == imp)
//            return true;
//    } else {
//        NSLog(@"Can't find method: %s in %s", sel_getName(sel), class_getName(cls));
//    }
//    
//    return false;
//}
//
//bool isMethodImplementedInClass(const Method method, const SEL sel, const Class cls) {
//    const Method methodTemp = class_getInstanceMethod(cls, sel);
//    if (methodTemp != nil) {
//        if (methodTemp == method)
//            return true;
//    } else {
//        NSLog(@"Can't find method: %s in %s", sel_getName(sel), class_getName(cls));
//    }
//    
//    return false;
//}
//
