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

